#!/bin/zsh
set -u

SKILL_NAME="let-ai-be-ai"
SOURCE_DIR="${0:A:h}"

pause_if_interactive() {
  if [[ -t 0 ]]; then
    printf '\n按回车键关闭窗口……'
    IFS= read -r _
  fi
}

fail() {
  printf '错误：%s\n' "$1" >&2
  pause_if_interactive
  exit 1
}

if (( $# == 0 )); then
  if [[ -n "${CODEX_HOME:-}" ]]; then
    if [[ "$CODEX_HOME" == "/" ]]; then
      fail "CODEX_HOME 不能是根目录。"
    fi
    TARGET_ROOT="${CODEX_HOME}/skills"
  else
    if [[ -z "${HOME:-}" || "$HOME" == "/" ]]; then
      fail "无法确定安全的用户主目录。"
    fi
    TARGET_ROOT="${HOME}/.codex/skills"
  fi
elif (( $# == 2 )) && [[ "$1" == "--target" ]]; then
  TARGET_ROOT="$2"
else
  printf '用法：%s [--target skills目录]\n' "$0" >&2
  exit 2
fi

if [[ -z "$TARGET_ROOT" || "$TARGET_ROOT" == "/" ]]; then
  fail "拒绝使用空目录或根目录作为安装位置。"
fi

TARGET_DIR="${TARGET_ROOT}/${SKILL_NAME}"

printf '\nLet AI Be AI - macOS 安装程序\n'
printf '安装位置："%s"\n\n' "$TARGET_DIR"

if [[ ! -f "$SOURCE_DIR/SKILL.md" || ! -f "$SOURCE_DIR/agents/openai.yaml" ]]; then
  fail "安装文件不完整。请先解压整个 let-ai-be-ai 文件夹，再运行 install.command。"
fi

if [[ -L "$TARGET_DIR" ]]; then
  fail "目标位置是符号链接。请检查该链接后手动安装。"
fi

if [[ -d "$TARGET_DIR" ]]; then
  printf '发现已有安装。是否更新？更新不会删除目标目录中的额外文件。[y/N] '
  reply=""
  IFS= read -r reply
  case "$reply" in
    y|Y|yes|YES|Yes) ;;
    *)
      printf '\n已取消安装，没有复制任何文件。\n'
      pause_if_interactive
      exit 0
      ;;
  esac
fi

if ! /bin/mkdir -p "$TARGET_ROOT"; then
  fail "无法创建用户 skills 目录。"
fi

if ! /usr/bin/ditto "$SOURCE_DIR" "$TARGET_DIR"; then
  fail "复制文件失败。"
fi

if [[ ! -f "$TARGET_DIR/SKILL.md" || ! -f "$TARGET_DIR/agents/openai.yaml" ]]; then
  fail "安装验证失败：必要文件缺失。"
fi

printf '\n安装完成。\n'
printf '已安装到："%s"\n' "$TARGET_DIR"
printf '如果 Let AI Be AI 没有立即出现在 Skills 中，请重启 Codex 或 ChatGPT 桌面端。\n'
pause_if_interactive
exit 0
