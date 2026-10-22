# Let AI Be AI（LABA）

> sometimes we don't want ais to be the analyst, the yes-man, the friend, the therapist, we just want ais to get the job done, and this skill is to tell ais to be themselves, aka, ais.

## 中文说明

LABA 是一个对话行为 skill，用于回应没有明确请求的个人陈述、观点、观察或情绪表达。它要求模型以用户实际说过的话为依据，避免擅自提供建议、诊断、辩论、情绪镜像，或者凭空发明关系与隐藏需求。

当用户提出明确请求时，模型仍然正常回答；LABA 只约束那些本来只是普通聊天的消息。它的目标不是让模型一味赞同，而是让回应更自然、克制、有内容，并且懂得及时停下。

### 安装

请先完整解压 ZIP。macOS 双击 install.command；如果文件不可执行，请运行：

    chmod +x install.command
    ./install.command

默认安装位置：~/.codex/skills/let-ai-be-ai。Windows 双击 install.cmd；默认安装位置为 %USERPROFILE%\\.codex\\skills\\let-ai-be-ai。如果设置了 CODEX_HOME，则使用对应的 skills 目录。安装完成后，如果 LABA 没有立即出现在 Skills 中，请重启 Codex 或 ChatGPT 桌面端。

### 使用

在 Codex 中显式提及 $let-ai-be-ai，或者让系统在符合 SKILL.md 中触发条件的对话里自动选择它。合格的回应应围绕用户实际提到的细节，做有限而有用的补充；它可以纠正推断，但不应把一句随口吐槽扩写成未经邀请的职业咨询或心理分析。

### 包内文件

- SKILL.md：skill 的行为规则与触发说明。
- agents/openai.yaml：显示名称、简介和默认提示词。
- install.command：macOS 安装程序。
- install.cmd：Windows 安装程序。
- README.md：本说明文件。

## English

LABA is a conversational-behavior skill for responding to personal remarks, opinions, observations, or emotional statements that contain no explicit request. It grounds the response in what the user actually said and discourages unsolicited advice, diagnosis, debate, emotional mirroring, or invented relationships and hidden goals.

When the user makes an explicit request, the model should answer normally. LABA applies only to ordinary conversational contributions rather than requests for action or analysis. Its goal is not blind agreement; it is to make replies more natural, restrained, useful, and willing to stop when the conversational turn is complete.

### Installation

Extract the ZIP archive completely before installing. On macOS, double-click install.command. If macOS says that the file is not executable, run:

    chmod +x install.command
    ./install.command

The default macOS installation path is ~/.codex/skills/let-ai-be-ai. On Windows, double-click install.cmd; the default path is %USERPROFILE%\\.codex\\skills\\let-ai-be-ai. If CODEX_HOME is set, the corresponding skills directory is used. Restart Codex or the ChatGPT desktop app if LABA does not immediately appear in Skills.

### Usage

Explicitly mention $let-ai-be-ai in Codex, or let the system select it automatically when a message matches the trigger conditions in SKILL.md. A suitable response should engage with a specific detail from the user's message and add a limited, useful contribution. It may correct an inference, but it should not turn a casual observation into unsolicited career advice or psychological analysis.

### Included files

- SKILL.md: behavior rules and trigger conditions.
- agents/openai.yaml: display name, short description, and default prompt.
- install.command: macOS installer.
- install.cmd: Windows installer.
- README.md: this documentation.
