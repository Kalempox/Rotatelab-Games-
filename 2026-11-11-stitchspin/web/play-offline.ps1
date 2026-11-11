# Serves this folder on http://localhost and opens the game in the default browser (hc publish-build).
# A browser runs the game only from a web address; this is a web address on this computer. Close the window to stop.
param([int]$Port = 8765, [switch]$NoBrowser)
$root = [IO.Path]::GetFullPath((Split-Path -Parent $MyInvocation.MyCommand.Path))
$types = @{ '.html'='text/html; charset=utf-8'; '.js'='text/javascript'; '.mjs'='text/javascript'; '.css'='text/css'; '.json'='application/json'; '.png'='image/png'; '.jpg'='image/jpeg'; '.jpeg'='image/jpeg'; '.webp'='image/webp'; '.svg'='image/svg+xml'; '.wasm'='application/wasm'; '.glb'='model/gltf-binary'; '.gltf'='model/gltf+json'; '.bin'='application/octet-stream'; '.webm'='video/webm'; '.mp4'='video/mp4'; '.woff'='font/woff'; '.woff2'='font/woff2'; '.ttf'='font/ttf'; '.mp3'='audio/mpeg'; '.ogg'='audio/ogg'; '.wav'='audio/wav'; '.txt'='text/plain'; '.md'='text/plain' }
$listener = $null
for ($p = $Port; $p -lt $Port + 20; $p++) {
  $candidate = New-Object System.Net.HttpListener
  $candidate.Prefixes.Add("http://localhost:$p/")
  try { $candidate.Start(); $listener = $candidate; $Port = $p; break } catch { $candidate.Close() }
}
if ($null -eq $listener) { Write-Host "No free port between $Port and $($Port + 19)."; exit 1 }
$url = "http://localhost:$Port/"
Write-Host "The game is running at $url - keep this window open while you play, close it to stop."
if (-not $NoBrowser) { Start-Process $url }
while ($listener.IsListening) {
  $ctx = $listener.GetContext()
  $path = [Uri]::UnescapeDataString($ctx.Request.Url.AbsolutePath.TrimStart('/'))
  if ($path -eq '') { $path = 'index.html' }
  $file = [IO.Path]::GetFullPath((Join-Path $root $path))
  if ($file.StartsWith($root) -and (Test-Path -LiteralPath $file -PathType Leaf)) {
    $ext = [IO.Path]::GetExtension($file).ToLower()
    if ($types.ContainsKey($ext)) { $ctx.Response.ContentType = $types[$ext] } else { $ctx.Response.ContentType = 'application/octet-stream' }
    $bytes = [IO.File]::ReadAllBytes($file)
    $ctx.Response.ContentLength64 = $bytes.Length
    $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
  } else { $ctx.Response.StatusCode = 404 }
  $ctx.Response.Close()
}
