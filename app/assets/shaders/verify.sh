#!/bin/sh

set -eu

dartPath="$(whereis -q dart)"
flutterDir="$(cd "$(dirname "$dartPath")/.." && pwd)"

impeller="$(find "$flutterDir" -name impellerc -type f -print -quit)"
shaderLib="$flutterDir/engine/src/flutter/impeller/compiler/shader_lib/"
runtime="$flutterDir/engine/src/flutter/impeller/runtime_stage/runtime_stage.fbs"

"$impeller" \
  --runtime-stage-metal \
  --iplr \
  --input=hex.frag \
  --sl=foo.sl \
  --spirv=foo.spirv \
  --include="$shaderLib" \
  --input-type=frag

flatc \
  --json \
  "$runtime" \
  -- ./foo.sl

cat foo.json
