#!/bin/bash

set -e

echo "=============================================="
echo " SERVICES HOME MOTION STYLE"
echo "=============================================="

STAMP=$(date +"%Y%m%d_%H%M%S")

mkdir -p backup/services-motion-$STAMP

cp src/pages/Services/index.tsx \
backup/services-motion-$STAMP/


python3 <<'PY'
from pathlib import Path

p = Path("src/pages/Services/index.tsx")

text = p.read_text()


# tambah import motion
if 'from "framer-motion"' not in text:
    text=text.replace(
        'import {',
        'import { motion } from "framer-motion";\n\nimport {',
        1
    )


# wrapper kiri
text=text.replace(
'''
<div>


<p

style={{
display:"inline-block",
''',
'''
<motion.div

initial={{
opacity:0,
y:30
}}

whileInView={{
opacity:1,
y:0
}}

transition={{
duration:0.6
}}

>


<p

style={{
display:"inline-block",
'''
)


# tutup wrapper kiri sebelum kolom kanan
text=text.replace(
'''
</p>


</div>



<div

style={{
display:"grid",
gap:"18px"
}}
''',
'''
</p>


</motion.div>



<div

style={{
display:"grid",
gap:"18px"
}}
'''
)


# map card motion
text=text.replace(
'''
return (

<div

key={item.name}

style={{
''',
'''
return (

<motion.div

key={item.name}

initial={{
opacity:0,
y:30
}}

whileInView={{
opacity:1,
y:0
}}

transition={{
delay:index*.1
}}

whileHover={{
y:-8
}}

style={{
'''
)


# tutup motion div
text=text.replace(
'''
</div>

)

})

}
''',
'''
</motion.div>

)

})

}
'''
)


# tambahkan index pada map
text=text.replace(
'services.map(item=>{',
'services.map((item,index)=>{'
)


p.write_text(text)

print("Services motion updated")

PY


npm run build


git add src/pages/Services/index.tsx

git commit -m "Match Services animation with Home ServicesPreview" || true

git push origin main || true


firebase deploy --only hosting


echo "=============================================="
echo " SERVICES MOTION COMPLETE"
echo " Backup:"
echo " backup/services-motion-$STAMP"
echo "=============================================="

