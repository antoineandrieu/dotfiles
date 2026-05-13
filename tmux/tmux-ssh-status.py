#!/usr/bin/env python3
"""Print a Dracula-colored tmux status segment for local/SSH context.

The script runs on the local machine from tmux status-left. It inspects the
active pane process tree, detects an ssh command, extracts its destination, and
uses a stable hash to assign that destination one of the Dracula accent colors.
"""

from __future__ import annotations

import hashlib
import os
import shlex
import subprocess
import sys
from collections import defaultdict, deque
from urllib.parse import urlparse

DRACULA = {
    "background": "#282a36",
    "current_line": "#44475a",
    "foreground": "#f8f8f2",
    "comment": "#6272a4",
    "cyan": "#8be9fd",
    "green": "#50fa7b",
    "orange": "#ffb86c",
    "pink": "#ff79c6",
    "purple": "#bd93f9",
    "red": "#ff5555",
    "yellow": "#f1fa8c",
}

ACCENTS = [
    DRACULA["purple"],
    DRACULA["pink"],
    DRACULA["cyan"],
    DRACULA["green"],
    DRACULA["orange"],
    DRACULA["yellow"],
    DRACULA["red"],
]

SSH_OPTIONS_WITH_VALUE = set("bcDEeFIiJLlmOoPpQRSWw")


def stable_accent(name: str) -> str:
    digest = hashlib.sha1(name.encode("utf-8")).digest()
    return ACCENTS[digest[0] % len(ACCENTS)]


def clean_destination(raw: str) -> str:
    if raw.startswith("ssh://"):
        parsed = urlparse(raw)
        return parsed.hostname or raw

    # user@host -> host
    host = raw.rsplit("@", 1)[-1]

    # [host]:port -> host
    if host.startswith("[") and "]" in host:
        return host[1 : host.index("]")]

    # host:remote-command/path is not an SSH destination port in normal ssh(1),
    # so keep aliases containing ':' intact unless it is clearly bracketed above.
    return host


def ssh_destination(command: str) -> str | None:
    try:
        argv = shlex.split(command)
    except ValueError:
        argv = command.split()

    if not argv:
        return None

    executable = os.path.basename(argv[0])
    if executable not in {"ssh", "ssh.exe"}:
        return None

    i = 1
    while i < len(argv):
        arg = argv[i]

        if arg == "--":
            i += 1
            break

        if not arg.startswith("-") or arg == "-":
            return clean_destination(arg)

        # -p 2222, -i key, -o Option=value, etc.
        if len(arg) == 2 and arg[1] in SSH_OPTIONS_WITH_VALUE:
            i += 2
            continue

        # Combined short option with value: -p2222, -i~/.ssh/key, -oFoo=bar.
        i += 1

    if i < len(argv):
        return clean_destination(argv[i])

    return None


def process_table() -> tuple[dict[int, tuple[int, str]], dict[int, list[int]]]:
    output = subprocess.check_output(
        ["ps", "-o", "pid=", "-o", "ppid=", "-o", "command=", "-ax"],
        text=True,
        stderr=subprocess.DEVNULL,
    )
    processes: dict[int, tuple[int, str]] = {}
    children: dict[int, list[int]] = defaultdict(list)

    for line in output.splitlines():
        parts = line.strip().split(None, 2)
        if len(parts) < 3:
            continue
        try:
            pid = int(parts[0])
            ppid = int(parts[1])
        except ValueError:
            continue
        command = parts[2]
        processes[pid] = (ppid, command)
        children[ppid].append(pid)

    return processes, children


def find_ssh_destination(root_pid: int) -> str | None:
    try:
        processes, children = process_table()
    except Exception:
        return None

    found: str | None = None
    queue: deque[int] = deque([root_pid])
    seen: set[int] = set()

    while queue:
        pid = queue.popleft()
        if pid in seen:
            continue
        seen.add(pid)

        if pid in processes:
            destination = ssh_destination(processes[pid][1])
            if destination:
                found = destination

        queue.extend(children.get(pid, []))

    return found


def segment(kind: str, name: str, accent: str) -> str:
    bg = DRACULA["background"]
    fill = DRACULA["purple"]
    fg = DRACULA["foreground"]
    label = name.upper()

    # Powerline-style blocks. The separator lands on the purple bar fill,
    # avoiding black gaps after the machine segment. Every color is Dracula.
    return (
        f"#[fg={bg},bg={accent},bold] {label} "
        f"#[fg={accent},bg={fill},nobold]"
        f"#{{?window_zoomed_flag,#[fg={DRACULA['orange']},bg={fill},bold] ZOOM ,}}"
        f"#[fg={fg},bg={fill},nobold]"
    )


def main() -> int:
    pane_pid = int(sys.argv[1]) if len(sys.argv) > 1 and sys.argv[1].isdigit() else os.getpid()
    local_host = sys.argv[2] if len(sys.argv) > 2 and sys.argv[2] else "local"

    remote = find_ssh_destination(pane_pid)
    if remote:
        print(segment("ssh", remote, stable_accent(remote)))
    else:
        print(segment("local", local_host, stable_accent(local_host)))

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
