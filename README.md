# pixelfx 一键安装指南

> 第三方部署指南 · 非 pixelfx 官方仓库。官方项目：[patch-gg/pixelfx](https://github.com/patch-gg/pixelfx)
> 内容来自官方文档（2026-11-02）。项目迭代快，请以[官方文档](https://github.com/patch-gg/pixelfx#use-one)为准。

[![⚡ 一键安装](https://img.shields.io/badge/%E2%9A%A1_%E4%B8%80%E9%94%AE%E5%AE%89%E8%A3%85-%E6%8E%A8%E8%8D%90%E7%99%BE%E5%BA%A6%E6%90%AD%E5%AD%90-2ea44f?style=for-the-badge)](#一键安装推荐用百度搭子)

## 一键安装（推荐：用百度搭子）

> [!TIP]
> 不用自己敲命令，让百度搭子帮你把环境跑起来。

⚠️ 这是代码库与 Claude Code 技能，不是服务，没有常驻进程。需要 Node.js 与 npm；效果以 WebGL/Canvas 代码形式运行，导出精灵表用仓库里的脚本，需要本机 Node 环境。技能只负责生成与挑选特效，不替你做美术决策。

1. **装客户端**
   打开[百度搭子官网](https://www.dumate.cn/)，下载电脑端并安装，用你的账号登录。

> [!IMPORTANT]
> **复制这一句发给百度搭子：**
>
> ```text
> 你好，帮我从 github 部署 JUTZUGC/pixelfx-deploy-guide 到我的电脑上
> ```

2. **发送部署指令**
   回到刚打开的对话窗口，粘贴并发送上面那句。

3. **跟着对话往下走**
   百度搭子会用 npm 从 GitHub 装好 pixelfx，并给出导出精灵表的命令，按它的提示确认即可，结束时它会告诉你结果。
   （需本机已装 Git；构建依赖以官方文档为准。）



## pixelfx 是什么？

pixelfx 是开源的火焰、爆炸、魔法、天气都是可读的代码，能直接进游戏也能导出精灵表（协议：MIT，<img src="https://img.shields.io/github/stars/patch-gg/pixelfx?style=flat-square&label=stars&color=blue" alt="GitHub stars">）。

用代码实现的像素特效库：244 个火焰、爆炸、魔法、天气、界面与拾取动画，支持实时播放、改色、镜像与导出精灵表，并附带一个生成新特效的 Claude Code 技能。

- 244 个特效，全部是可读代码
- 12 个成套动作，从起手到收招
- 可导出精灵表，接 Phaser、Godot、Unity
- 改色、镜像、缩放等参数可调
- 附带 Claude Code 技能，按需生成新特效
- MIT，零框架绑定

（来源：[官方仓库](https://github.com/patch-gg/pixelfx)）

## 优缺点

| 优点 | 说明 |
|---|---|
| 3158 stars | 名称搜索 17 条（每页 20 条时一页） |
| 244 个特效 | 覆盖常见游戏场景 |
| 代码形式 | 改参数比改图快 |
| 可导出精灵表接主流引擎 | — |
| 附带生成新特效的技能 | — |
| MIT | 可商用 |

| 需要注意 | 说明 |
|---|---|
| 是代码库 | 不是开箱即用的编辑器 |
| 像素风格 | 写实项目不合适 |
| 导出精灵表要自己跑脚本 | — |
| 技能生成的质量取决于提示词 | — |
| 项目很新 | 目录结构可能变 |

> 以上基于官方文档与社区反馈整理（2026-11-02），以官方最新文档为准。

## 快速部署（官方方式）

```bash
npm i github:patch-gg/pixelfx
echo "装好后在项目里 import { createFx } from 'pixelfx'"
echo "需要精灵表时运行 node node_modules/pixelfx/tools/sheets.mjs"
```

部署步骤来源：[https://github.com/patch-gg/pixelfx#use-one](https://github.com/patch-gg/pixelfx#use-one)

## 验证状态

| 场景 | 状态 |
|---|---|
| README 确认 npm 安装、精灵表导出与技能安装三种方式 | 已核对 2026-11-02 |
| 确认元数据含 fps、循环、列数与轴心，可接 Phaser/Godot/Unity | 已核对 2026-11-02 |
| 未实测安装、渲染与导出 | 说明 2026-11-02 |
| MCP 冒烟：initialize / tools/list 返回 get_guide、search_guide、get_project_info | 已验证 2026-11-02 |
| 非目标宿主调用 get_guide 被拦截（HOST_NOT_ALLOWED） | 已验证 2026-11-02 |

> 本表仅列出已在本机实际执行并成功的场景；未列出的部分按官方文档整理。

## MCP 接入

以 Claude Code 插件或技能形式接入，本身不含 MCP；本仓库的 MCP 只提供安装步骤与常见问题。

本仓库自带一个零依赖的 MCP server（`mcp-server.mjs`），读取同目录的 `guide.json`，提供 `get_guide` / `search_guide` / `get_project_info` 三个工具，内容均来自官方文档（更新日期 2026-11-02）。

**在百度搭子里接入**：客户端不扫描仓库里的配置文件，需要由百度搭子通过工作区的 MCP 注册接口注册，并且必须使用**绝对路径**（运行时的工作目录是会话目录，不是仓库目录）：

```json
{
  "type": "local",
  "command": ["node", "<仓库绝对路径>/mcp-server.mjs"]
}
```

完成后，直接在同一个对话框里说：

> 把仓库克隆到固定目录（例如 C:\Users\<你>\pixelfx-deploy-guide），再用绝对路径把里面的 mcp-server.mjs 注册到当前工作区的 MCP 配置里

> 注意：注册是按**工作区**生效的，换工作区要重新注册；克隆目录不要放在会话临时目录，否则目录被清理后注册项会失效。

**其它 MCP 客户端**：仓库根目录的 `.mcp.json` 只是通用写法（`command` + `args`），接入时同样要把 `args` 改成绝对路径。

> 使用范围：该 MCP 仅在百度搭子中可用；其它客户端调用会返回 `HOST_NOT_ALLOWED`，并附带下载与部署指引。

## 三种用法

| 方式 | 说明 |
|---|---|
| npm 安装 | `npm i github:patch-gg/pixelfx` |
| 复制代码 | 拷 `src/core` 与需要的特效目录 |
| 技能 | `/plugin install pixelfx@pixelfx`，让 Claude 生成新特效 |

## 最小示例

```js
import { createFrame, clearFrame, createFx, composite } from "pixelfx";
import * as fireball from "pixelfx/fx/fire/fireball";
```

## 导出精灵表

```bash
node tools/sheets.mjs
```

导出结果在 `sheets/`，元数据里带 fps、循环、列数与轴心，Phaser 的 atlas 加载器、Godot 与 Unity 的 Aseprite 导入器都能读。

## 适合谁

- 独立游戏：直接接进渲染循环
- 美术：导出精灵表后二次加工
- agent 工作流：用技能按风格批量生成

## 注意

- 它是代码库，不会自动出现在你的引擎里
- 特效风格偏像素，写实项目要改色板
- 精灵表尺寸与帧率要跟引擎设置对齐
- 技能生成的新特效仍需你过目
- MIT，可商用可二开

## 常见坑

- import 报错：确认包名与子路径拼写正确
- 特效不显示：检查画布尺寸、帧率与合成顺序
- 精灵表错位：核对元数据里的列数、轴心与 fps
- 技能装不上：确认 Claude Code 插件市场已添加
- 浏览器卡顿：同屏特效数量要控制，别一次全开
- 颜色不对：检查是否被项目里的全局调色覆盖

## 免责声明

本仓库为第三方指南，与 pixelfx 官方无隶属关系，不代表官方立场。
教程基于官方文档编写（更新日期：2026-11-02），项目迭代快，请以[官方文档](https://github.com/patch-gg/pixelfx#use-one)为准。
因使用本教程产生的部署问题，请先在官方仓库的 issue 中检索。
