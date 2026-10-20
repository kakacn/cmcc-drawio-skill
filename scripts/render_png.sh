#!/bin/bash
# CMCC 流程图 PNG 导出：render_png.sh <html路径> <输出png路径> [宽度=2000] [高度=940] [scale=2]
# A4 手册版示例：render_png.sh in.html out.png 1600 1390 1.2
set -e
HTML="$1"
OUT="${2:-flowchart.png}"
W="${3:-2000}"
H="${4:-940}"
SCALE="${5:-2}"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
"$CHROME" --headless --disable-gpu --window-size="${W},${H}" --force-device-scale-factor="${SCALE}" \
  --screenshot="$OUT" --hide-scrollbars "file://$HTML" 2>&1 | grep -v -E "task_policy|CVDisplayLink|allocator" || true
echo "written: $OUT"
