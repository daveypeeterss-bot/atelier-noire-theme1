
#!/bin/bash

mkdir -p atelier-noire-theme/{assets,config,layout,sections,templates}

# layout
cat <<EOF > atelier-noire-theme/layout/theme.liquid
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>{{ shop.name }}</title>
{{ content_for_header }}
<link rel="stylesheet" href="{{ 'base.css' | asset_url }}">
</head>
<body>
{{ content_for_layout }}
</body>
</html>
EOF

# css
cat <<EOF > atelier-noire-theme/assets/base.css
body {background:#0B0B0B;color:#F5F5F5;margin:0;font-family:serif;}
a{color:#F5F5F5;text-decoration:none;}
button:hover{transform:scale(1.05);}
.hero video{position:absolute;width:100%;height:100%;object-fit:cover;}
EOF

# hero
cat <<EOF > atelier-noire-theme/sections/an-hero-video.liquid
<section style="height:100vh;position:relative;">
<video autoplay muted loop playsinline>
<source src="YOUR-VIDEO.mp4" type="video/mp4">
</video>
<div style="position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);text-align:center;">
<h1 style="font-size:60px;">ATELIER NOIRÉ</h1>
<p>CERCLE PRIVÉ</p>
<p>For the select few.</p>
<a href="/collections/all" style="border:1px solid white;padding:12px 30px;">SHOP NOW</a>
</div>
</section>
EOF

# marquee
cat <<EOF > atelier-noire-theme/sections/an-marquee.liquid
<div style="overflow:hidden;padding:10px 0;">
<div style="white-space:nowrap;animation:scroll 15s linear infinite;">
ATELIER NOIRÉ — LIMITED DROP — NO RESTOCK —
</div>
</div>
<style>
@keyframes scroll {from{transform:translateX(0);}to{transform:translateX(-50%);}}
</style>
EOF

# featured
cat <<EOF > atelier-noire-theme/sections/an-featured.liquid
<section style="padding:80px;text-align:center;">
<h2>FEATURED DROP</h2>
<p>Premium tracksuits, hoodies and tees.</p>
<a href="/collections/all" style="border:1px solid white;padding:10px 25px;">SHOP COLLECTION</a>
</section>
EOF

# lookbook
cat <<EOF > atelier-noire-theme/sections/an-lookbook.liquid
<section style="display:grid;grid-template-columns:repeat(3,1fr);gap:10px;">
<img src="https://via.placeholder.com/400">
<img src="https://via.placeholder.com/400">
<img src="https://via.placeholder.com/400">
</section>
EOF

# identity
cat <<EOF > atelier-noire-theme/sections/an-identity.liquid
<section style="text-align:center;padding:80px;">
<h2>Discipline over hype.</h2>
<p>Built for those who move differently.</p>
</section>
EOF

# footer
cat <<EOF > atelier-noire-theme/sections/an-footer.liquid
<footer style="text-align:center;padding:40px;">
<p>ATELIER NOIRÉ</p>
<p>Luxury streetwear.</p>
</footer>
EOF

# index
cat <<EOF > atelier-noire-theme/templates/index.json
{
"sections":{
"hero":{"type":"an-hero-video"},
"marquee":{"type":"an-marquee"},
"featured":{"type":"an-featured"},
"lookbook":{"type":"an-lookbook"},
"identity":{"type":"an-identity"},
"footer":{"type":"an-footer"}
},
"order":["hero","marquee","featured","lookbook","identity","footer"]
}
EOF

# product
cat <<EOF > atelier-noire-theme/templates/product.json
{
"sections":{"main":{"type":"main-product"}},
"order":["main"]
}
EOF

# settings
cat <<EOF > atelier-noire-theme/config/settings_schema.json
[
{"name":"Theme settings","settings":[]}
]
EOF

echo "Theme created successfully"
