from pathlib import Path
from html.parser import HTMLParser
import sys

docs = Path("docs")
if not docs.exists():
    print("SITE_LINKS_FAIL: docs/ nao existe")
    sys.exit(1)

class LinkParser(HTMLParser):
    def __init__(self):
        super().__init__()
        self.links = []
    def handle_starttag(self, tag, attrs):
        if tag.lower() == "a":
            for k, v in attrs:
                if k.lower() == "href" and v:
                    self.links.append(v)

errors = []
for html_file in docs.glob("*.html"):
    parser = LinkParser()
    parser.feed(html_file.read_text(encoding="utf-8", errors="ignore"))
    for href in parser.links:
        if href.startswith(("http://", "https://", "mailto:", "#")):
            continue
        clean = href.split("#", 1)[0].split("?", 1)[0]
        if not clean:
            continue
        target = (html_file.parent / clean).resolve()
        if not target.exists():
            errors.append((str(html_file), href))

if errors:
    print("SITE_LINKS_FAIL")
    for src, href in errors:
        print(f"BROKEN: {src} -> {href}")
    sys.exit(1)

print("SITE_LINKS_OK")
