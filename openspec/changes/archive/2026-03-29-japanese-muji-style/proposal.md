## Why

目前 linktr 頁面採用野獸派（Fauvism）紫色主題，視覺風格強烈但不符合期望的品牌調性。需要改為日式極簡（MUJI）風格，使用 Catppuccin Latte 淺色系配色，與 cashwu.github.io 部落格的設計語言保持一致。

## What Changes

- 將 CSS 色彩系統從野獸派紫色系（`--fauve-*`）全面替換為 Catppuccin Latte 色票（base、mantle、surface、text、sapphire 等）
- 加入 MUJI 風格陰影系統（`--muji-sm`、`--muji`、`--muji-md`）
- 背景從複雜幾何圖案改為微妙的淺色漸層
- 頭像從粗黑邊框 + 黃色偏移陰影 + 旋轉動畫，改為細邊框 + 微妙陰影
- 名稱文字從粗體大字 + text-shadow 改為中等字重、乾淨排版
- 連結卡片從每張不同配色的大膽風格，統一為白底 + 細邊框 + 微妙陰影
- 動畫從彈跳式 popIn 改為溫和的 fadeInUp
- 移除隨機換色的 JavaScript 互動效果
- 加入 Noto Sans JP 字體以配合日式設計
- Footer 簡化為低調風格

## Non-Goals

- 不新增暗色模式（僅使用 Latte 淺色系）
- 不變更頁面內容（連結項目、文字內容維持不變）
- 不拆分為多個檔案（維持單一 `index.html` 結構）
- 不加入新的 JavaScript 功能

## Capabilities

### New Capabilities

- `japanese-muji-theme`: 日式極簡視覺主題，涵蓋色彩系統、排版、卡片樣式、背景、動畫等全部視覺表現

### Modified Capabilities

（無）

## Impact

- 受影響的程式碼：`index.html`（CSS 變數、樣式規則、HTML class、JavaScript 區塊）
- 受影響的依賴：新增 Google Fonts CDN（Noto Sans JP）
- 受影響的系統：無（純前端靜態頁面）
