# Let AI Be AI（LABA）

LABA 是一个对话行为 skill，用于回应没有明确请求的个人陈述、观点、观察或情绪表达。它要求模型以用户实际说过的话为依据，避免擅自提供建议、诊断、辩论、情绪镜像，或者凭空发明关系与隐藏需求。

当用户提出明确请求时，模型仍然正常回答；LABA 只约束那些本来只是普通聊天的消息。它的目标不是让模型一味赞同，而是让回应更自然、克制、有内容，并且懂得及时停下。

## 安装

请先完整解压 ZIP，不要直接在压缩包预览窗口中运行安装程序。

### macOS

双击 `install.command`。安装程序只为当前用户安装，不需要管理员权限；如果检测到已有版本，会先询问是否更新。

如果 macOS 提示文件不可执行，请在解压后的文件夹中打开终端并运行：

```bash
chmod +x install.command
./install.command
```

默认安装位置：

```text
~/.codex/skills/let-ai-be-ai
```

如果设置了 `CODEX_HOME`，安装位置为 `$CODEX_HOME/skills/let-ai-be-ai`。也可以通过 `./install.command --target <skills目录>` 指定其他 skills 根目录。

### Windows

双击 `install.cmd`。安装程序只为当前用户安装，不需要管理员权限；如果检测到已有版本，会先询问是否更新。

默认安装位置：

```text
%USERPROFILE%\\.codex\\skills\\let-ai-be-ai
```

如果设置了 `CODEX_HOME`，安装位置为 `%CODEX_HOME%\\skills\\let-ai-be-ai`。

安装完成后，如果 LABA 没有立即出现在 Skills 中，请重启 Codex 或 ChatGPT 桌面端。

## 手动安装与卸载

手动安装时，将整个 `let-ai-be-ai` 文件夹复制到你的用户 skills 目录，并确保 `SKILL.md` 直接位于 `let-ai-be-ai` 文件夹中。

卸载时，关闭应用并删除已安装的 `let-ai-be-ai` 文件夹即可。安装程序不联网，也不会修改其他 skill。

## 使用

在 Codex 中显式提及 `$let-ai-be-ai`，或者让系统在符合 `SKILL.md` 中触发条件的对话里自动选择它。

示例输入：

```text
我才发现不是所有同事都六点半下班，有些人六点就走了。
```

合格的回应应围绕用户实际提到的细节，做有限而有用的补充；它可以纠正推断，但不应把一句随口吐槽扩写成未经邀请的职业咨询或心理分析。

## 包内文件

- `SKILL.md`：skill 的行为规则与触发说明。
- `agents/openai.yaml`：显示名称、简介和默认提示词。
- `install.command`：macOS 安装程序。
- `install.cmd`：Windows 安装程序。
- `README.md`：本说明文件。
