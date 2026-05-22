import os
import sys
import subprocess

# تشغيل bot.py باستخدام python3.11 (إذا كان موجود في السيرفر)
os.execvp("python3.11", ["python3.11", "bot.py"])
