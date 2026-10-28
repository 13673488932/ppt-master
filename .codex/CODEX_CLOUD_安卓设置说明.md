# PPT Master — Codex Cloud 设置及安卓使用

此文件用于用户 Fork 仓库 **13673488932/ppt-master** 的 Codex Cloud 环境。
PPT Master 原版仓库：https://github.com/hugohe3/ppt-master

## 1. 在网页版创建环境（须用户自己完成授权与发布）

打开 https://chatgpt.com/codex ，新建任务选择 **Work in → Cloud → Select environment → Create environment**。选择 **13673488932/ppt-master**，然后点击 **Get started**。
环境建议命名 **PPT Master 学术汇报**，访问权限选择 **Only me**。

## 2. 云端安装与校验

允许 **Package managers** 网络访问，用于从 PyPI 安装 Python 依赖（不需要开启全公网访问）。

在 Codex Cloud 环境配置的 **Install script** 中填写：

```bash
bash .codex/cloud_setup.sh
```

若 Codex 正在交互式准备环境，也可直接发送：

> 请使用仓库的 .codex/cloud_setup.sh 安装和检查依赖，遵循 AGENTS.md 和 skills/ppt-master/SKILL.md。不得绕过 attribution_guard.py。无须 API Key 就先测试基础 Python/SVG/PPTX 导出能力；不要伪称测试通过。若出现依赖或网络问题请报告具体错误。

这段脚本只验证依赖与原版完整性保护；**不是生成 PPTX 的全流程成功证明**。初次使用时还应实际制作和打开一份 PPTX 进行验收。

## 3. 发布环境

查看 Codex 返回的安装日志及检查结果，成功后点击 **Publish**。安装失败时先修复而不是发布。环境需要在 Codex 的网页端或桌面端创建、发布；成功后可用手机端 Codex 选择此云端环境。

## 4. 安卓端首次任务（可复制）

> 使用此仓库内的原版 PPT Master Skill 做一份 16:9、8 页的社会工作研究生学术汇报 PPT。主题为“生成式 AI 辅助需求评估写作中社会工作学生的专业边界实践与调适”。先完整阅读 AGENTS.md、skills/ppt-master/SKILL.md，严格执行 attribution_guard.py，再按路由流程选择生成模式，不得跳过门禁。保持学术准确性，明确这是尚未访谈的研究方案，重点展示学者观点、研究差距和质性方法。生成可编辑 PPTX，检查版式后提供成品文件位置和实际验证记录。

上传包含案主个人信息、未授权实习记录或其他敏感资料前请先脱敏，优先使用课程模拟案例。

## 5. 注意

- 此方案是把原版 PPT Master Skill 配置进 **Codex Cloud 环境**，不是将它安装成 ChatGPT 对话中的通用插件。
- 默认无需在 GitHub 仓库里保存 API Key、口令或 .env。可选图片生成/语音等需要供应商凭据时，使用 Codex 云环境的密钥管理。
- 来源为用户 Fork 的原版项目。上游更新可能影响依赖或工具运行，环境更新后应重新测试。
- 未经云端真实测试，不能把脚本存在视为云端部署成功。
