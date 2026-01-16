#!/bin/bash

# Simple script to start a local web server for testing

echo "🚀 Starting local web server..."
echo ""
echo "📂 Serving files from: $(pwd)"
echo "🌐 Open your browser to: http://localhost:8000"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

# Try Python 3 first, then Python 2, then fail
if command -v python3 &> /dev/null; then
    echo "✅ Using Python 3"
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    echo "✅ Using Python 2"
    python -m SimpleHTTPServer 8000
else
    echo "❌ Error: Python not found"
    echo ""
    echo "Please install Python or use another method:"
    echo "  - Install Python from python.org"
    echo "  - Use Node.js: npx http-server -p 8000"
    echo "  - Use PHP: php -S localhost:8000"
    echo "  - Use VS Code Live Server extension"
    exit 1
fi
