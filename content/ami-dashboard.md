---
title: "AMI Dashboard"
date: 2024-12-19
draft: false
description: "Adaptive Media Intelligence - Comprehensive Analytics Dashboard"
tags: ["analytics", "dashboard", "media", "data-science"]
categories: ["projects"]
showToc: false
TocOpen: false
hidemeta: false
comments: false
canonicalURL: "https://stencilled.me/ami-dashboard"
disableHLJS: false
disableShare: false
hideSummary: false
searchHidden: false
ShowReadingTime: false
ShowBreadCrumbs: false
ShowPostNavLinks: false
ShowWordCount: false
ShowRssButtonInSectionTermList: false
UseHugoToc: false
---

<div id="ami-dashboard-container" style="width: 100%; height: 100vh; border: none; overflow: hidden;">
    <iframe 
        id="ami-dashboard-frame"
        src="https://ami-dashboard.vercel.app"
        style="width: 100%; height: 100vh; border: none; overflow: hidden;"
        title="AMI Dashboard"
        allowfullscreen>
    </iframe>
</div>

<script>
// Ensure the iframe loads properly
document.addEventListener('DOMContentLoaded', function() {
    const iframe = document.getElementById('ami-dashboard-frame');
    
    // Add loading state
    iframe.style.opacity = '0';
    iframe.style.transition = 'opacity 0.3s ease-in-out';
    
    iframe.onload = function() {
        iframe.style.opacity = '1';
    };
    
    // Handle iframe errors
    iframe.onerror = function() {
        console.error('Failed to load AMI Dashboard');
        iframe.style.display = 'none';
        document.getElementById('ami-dashboard-container').innerHTML = 
            '<div style="text-align: center; padding: 50px; color: #666;">' +
            '<h2>AMI Dashboard</h2>' +
            '<p>The dashboard is currently being deployed. Please check back soon!</p>' +
            '<a href="https://ami-dashboard.vercel.app" target="_blank" style="color: #007bff;">Open Dashboard in New Tab</a>' +
            '</div>';
    };
});
</script>

<style>
/* Custom styles for the dashboard page */
#ami-dashboard-container {
    margin: 0;
    padding: 0;
    background: #f8f9fa;
}

#ami-dashboard-frame {
    background: white;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Responsive design */
@media (max-width: 768px) {
    #ami-dashboard-container {
        height: calc(100vh - 60px);
    }
    
    #ami-dashboard-frame {
        height: calc(100vh - 60px);
    }
}
</style> 