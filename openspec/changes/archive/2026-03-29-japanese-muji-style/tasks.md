## 1. 色彩與基礎系統

- [x] 1.1 建立 Catppuccin Latte color system：替換 `:root` 中所有 `--fauve-*` 變數，新增 Latte 色彩變數（base、mantle、crust、surface0、surface1、text、subtext0、subtext1、sapphire、lavender）和 MUJI shadow system 變數（`--muji-sm`、`--muji`、`--muji-md`）
- [x] 1.2 在 `<head>` 中加入 Google Fonts 連結，載入 Noto Sans JP（weights 300、400、500、700），並更新 `body` 的 `font-family` 為 Japanese-friendly typography

## 2. 背景與版面

- [x] 2.1 將 `.background` 改為 minimal background（`linear-gradient(180deg, var(--latte-base), var(--latte-mantle))`），移除 `.background::before` 和 `.background::after` 的所有幾何圖案
- [x] [P] 2.2 更新 `.container` 的 padding 和 max-width，增加留白空間

## 3. 頭像與名稱

- [x] [P] 3.1 重新設計 clean avatar presentation：改為 `2px solid var(--latte-surface0)` 邊框 + `var(--muji)` 陰影，hover 改為陰影加深，移除 HTML 中 `img` 的 `pulse` class 和 CSS 中的 `@keyframes rotate`
- [x] [P] 3.2 套用 understated name typography：font-weight 500、font-size 2rem、color `var(--latte-text)`、移除所有 text-shadow

## 4. 連結卡片

- [x] 4.1 實作 unified link card style：白底 + `1px solid var(--latte-surface0)` + `var(--muji-sm)` 陰影，移除所有 `nth-child` 個別配色規則，移除 `text-transform: uppercase`
- [x] 4.2 套用 sapphire accent for icons：icon 顏色改為 `var(--latte-sapphire)`，移除 `filter: drop-shadow`
- [x] 4.3 更新 link card hover effect：`translateY(-2px)` + `var(--muji-md)` 陰影 + sapphire 邊框色；active 狀態恢復原位

## 5. 動畫與互動

- [x] 5.1 將 `.fade-in` 從 `popIn` 改為 gentle fade-in animation（`fadeInUp`：opacity 0→1、translateY 12px→0），刪除 `@keyframes popIn`
- [x] [P] 5.2 移除整個 `<script>` 區塊，實現 no random color JavaScript

## 6. Footer 與收尾

- [x] [P] 6.1 套用 understated footer 樣式：color `var(--latte-subtext0)`、font-size 0.8rem、font-weight 300、移除 text-shadow，年份更新為 2026
- [x] [P] 6.2 更新 `@media (max-width: 480px)` 響應式樣式，移除不再需要的粗邊框和 text-shadow 覆寫
