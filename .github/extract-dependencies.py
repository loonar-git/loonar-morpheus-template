import os
import re

def extract_dependencies(directory):
    dependencies = set()
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.py'):
                with open(os.path.join(root, file)) as f:
                    for line in f:
                        match = re.match(r'^\s*import\s+([a-zA-Z0-9_]+)', line)
                        if match:
                            dependencies.add(match.group(1))
                        match = re.match(r'^\s*from\s+([a-zA-Z0-9_]+)', line)
                        if match:
                            dependencies.add(match.group(1))
    return dependencies

if __name__ == '__main__':
    deps = extract_dependencies('/src')
    with open('/src/requirements.txt', 'w') as f:
        for dep in deps:
            f.write(dep + '\n')
