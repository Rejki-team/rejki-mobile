import os
import glob

# Path ke folder icons
icons_path = r"f:\RIZKI\A-Hustle Job\rejki\hehe\rejki\packages\designsystems\assets\icons"

# Get all SVG files
svg_files = glob.glob(os.path.join(icons_path, "*.svg"))

fixed_count = 0
for svg_file in svg_files:
    try:
        with open(svg_file, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Check if file has HTML entities
        if '&lt;' in content or '&gt;' in content:
            # Replace HTML entities
            content = content.replace('&lt;', '<')
            content = content.replace('&gt;', '>')
            
            # Write back
            with open(svg_file, 'w', encoding='utf-8') as f:
                f.write(content)
            
            fixed_count += 1
            print(f"Fixed: {os.path.basename(svg_file)}")
    except Exception as e:
        print(f"Error processing {svg_file}: {e}")

print(f"\nTotal files fixed: {fixed_count}")
