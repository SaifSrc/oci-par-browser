# OCI Object Storage Browser

This project is a lightweight, client-side web application for browsing the contents of an Oracle Cloud Infrastructure (OCI) Object Storage bucket using a Pre-Authenticated Request (PAR) URL. It requires no backend services or additional dependencies—just serve the static page and paste a valid bucket-level PAR URL to explore objects and inspect their metadata.

## Features
- Fetch the complete list of objects within a bucket by following pagination tokens automatically.
- Display object metadata (size, content type, last modified, custom OPC metadata, etc.) on demand.
- Inline previews for images plus quick-look text/JSON snippets (safely truncated to protect bandwidth).
- Responsive, accessible design that works well on both desktop and mobile devices.
- Comprehensive error handling for malformed, expired, or unauthorized PAR URLs.

## Quick start
Open `index.html` in any modern browser and provide a bucket-level PAR URL (ending in `/o/`). The app runs entirely in the browser and does not store any credentials.

## Local development server
If you prefer to serve the page locally while developing, you can use any static file server. For example, using Python:

```bash
python3 -m http.server 8000
```

Then open [http://localhost:8000/index.html](http://localhost:8000/index.html) in your browser.

## Preview capabilities
- Image objects are streamed and shown as thumbnails directly in the browser. Object URLs are revoked automatically when you
  navigate away to avoid memory leaks.
- Text, JSON, and XML content is fetched in small chunks (up to 64 KB) and displayed inline so you can peek at structured files
  without downloading the entire object.
- For other content types, the app provides a secure download link that opens the object in a separate tab via the PAR URL.

## Containerized deployment
You can build and run a Docker image that serves the app through Nginx:

```bash
# Build the image
docker build -t oci-par-browser .

# Run the container
docker run --rm -p 8080:80 oci-par-browser
```

Visit [http://localhost:8080](http://localhost:8080) to use the app.

## Deployment tips
- Because the application is static, it can be hosted on any CDN, object storage bucket, or static web host (e.g., GitHub Pages, Netlify, OCI Object Storage Static Website Hosting).
- Ensure CORS settings on the hosting platform allow the browser to reach OCI Object Storage endpoints.
- When distributing the page, remind users to manage PAR URLs securely, as they grant direct access to bucket contents.
