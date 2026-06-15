<<<<<<< HEAD
#!/usr/bin/env python3
"""
Script to generate colored PNG book cover images.
Run this script in the assets/images/ directory.
"""

from PIL import Image, ImageDraw, ImageFont
import os

# Define book covers: (filename, background_color, title_text, text_color)
books = [
    ('clean_code.png', (25, 55, 130), 'Clean\nCode', (255, 255, 255)),
    ('atomic_habits.png', (76, 175, 80), 'Atomic\nHabits', (255, 255, 255)),
    ('rich_dad.png', (255, 152, 0), 'Rich Dad\nPoor Dad', (255, 255, 255)),
    ('deep_work.png', (156, 39, 176), 'Deep\nWork', (255, 255, 255)),
    ('psychology_money.png', (184, 134, 11), 'Psychology\nof Money', (255, 255, 255)),
]

def create_book_covers():
    """Create book cover PNG images."""
    for filename, bg_color, title, text_color in books:
        # Create image (book cover dimensions: 150x220 pixels)
        img = Image.new('RGB', (150, 220), color=bg_color)
        draw = ImageDraw.Draw(img)
        
        # Try to use a nice font, fallback to default
        try:
            font = ImageFont.truetype("arial.ttf", 20)
        except:
            font = ImageFont.load_default()
        
        # Calculate text position (centered)
        bbox = draw.textbbox((0, 0), title, font=font)
        text_width = bbox[2] - bbox[0]
        text_height = bbox[3] - bbox[1]
        x = (150 - text_width) // 2
        y = (220 - text_height) // 2
        
        # Draw text
        draw.text((x, y), title, fill=text_color, font=font)
        
        # Save image
        img.save(filename)
        print(f"✓ Created {filename}")

if __name__ == '__main__':
    try:
        create_book_covers()
        print("\n✓ All book cover images created successfully!")
        print("Move these PNG files to: assets/images/")
    except Exception as e:
        print(f"✗ Error: {e}")
        print("Make sure PIL/Pillow is installed: pip install Pillow")
=======
#!/usr/bin/env python3
"""
Script to generate colored PNG book cover images.
Run this script in the assets/images/ directory.
"""

from PIL import Image, ImageDraw, ImageFont
import os

# Define book covers: (filename, background_color, title_text, text_color)
books = [
    ('clean_code.png', (25, 55, 130), 'Clean\nCode', (255, 255, 255)),
    ('atomic_habits.png', (76, 175, 80), 'Atomic\nHabits', (255, 255, 255)),
    ('rich_dad.png', (255, 152, 0), 'Rich Dad\nPoor Dad', (255, 255, 255)),
    ('deep_work.png', (156, 39, 176), 'Deep\nWork', (255, 255, 255)),
    ('psychology_money.png', (184, 134, 11), 'Psychology\nof Money', (255, 255, 255)),
]

def create_book_covers():
    """Create book cover PNG images."""
    for filename, bg_color, title, text_color in books:
        # Create image (book cover dimensions: 150x220 pixels)
        img = Image.new('RGB', (150, 220), color=bg_color)
        draw = ImageDraw.Draw(img)
        
        # Try to use a nice font, fallback to default
        try:
            font = ImageFont.truetype("arial.ttf", 20)
        except:
            font = ImageFont.load_default()
        
        # Calculate text position (centered)
        bbox = draw.textbbox((0, 0), title, font=font)
        text_width = bbox[2] - bbox[0]
        text_height = bbox[3] - bbox[1]
        x = (150 - text_width) // 2
        y = (220 - text_height) // 2
        
        # Draw text
        draw.text((x, y), title, fill=text_color, font=font)
        
        # Save image
        img.save(filename)
        print(f"✓ Created {filename}")

if __name__ == '__main__':
    try:
        create_book_covers()
        print("\n✓ All book cover images created successfully!")
        print("Move these PNG files to: assets/images/")
    except Exception as e:
        print(f"✗ Error: {e}")
        print("Make sure PIL/Pillow is installed: pip install Pillow")
>>>>>>> e2fe3a3545936a07f6ce4c7895a87e6b446ffc3a
