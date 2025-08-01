# 🚀 AMI Dashboard Integration for stencilled.me

## Overview

This integration adds the **Adaptive Media Intelligence (AMI) Dashboard** as a new page/app within your stencilled.me Hugo site. The dashboard will be accessible at `https://stencilled.me/ami-dashboard/`.

## What's Been Added

### ✅ **New Page: `/ami-dashboard/`**
- **File:** `content/ami-dashboard.md`
- **Features:**
  - Full-screen iframe integration
  - Responsive design
  - Loading states and error handling
  - SEO-optimized metadata

### ✅ **Navigation Menu**
- **Added to:** `config.toml`
- **Menu Item:** "AMI Dashboard" (weight: 55)
- **URL:** `/ami-dashboard/`

### ✅ **Deployment Script**
- **File:** `deploy-ami.sh`
- **Features:**
  - Automated deployment to Vercel + Railway
  - Hugo site building and deployment
  - Integration testing
  - URL management

## Architecture

```
stencilled.me (Hugo Site)
├── /ami-dashboard/ (New Page)
│   └── iframe → AMI Dashboard (Vercel)
│       └── API calls → AMI Backend (Railway)
```

## Quick Deployment

### **Option 1: Automated Script (Recommended)**
```bash
# Navigate to stencilled.me directory
cd "/Users/senthil/Desktop/New Folder With Items/stencilled.me-master"

# Run the deployment script
./deploy-ami.sh
```

### **Option 2: Manual Deployment**

#### **Step 1: Deploy AMI Dashboard**
```bash
# Deploy frontend to Vercel
cd /Users/senthil/Desktop/genbi-analytics/frontend
npm i -g vercel
vercel --prod

# Deploy backend to Railway
cd /Users/senthil/Desktop/genbi-analytics/backend
npm i -g @railway/cli
railway up
```

#### **Step 2: Update Hugo Site**
```bash
# Navigate to stencilled.me directory
cd "/Users/senthil/Desktop/New Folder With Items/stencilled.me-master"

# Update the iframe URL in content/ami-dashboard.md
# Replace "https://ami-dashboard.vercel.app" with your actual Vercel URL

# Build and deploy Hugo site
hugo --minify
git add .
git commit -m "Add AMI Dashboard integration"
git push
```

## Configuration

### **Environment Variables**

#### **AMI Backend (Railway):**
```bash
DATA_MODE=csv
ENVIRONMENT=production
CORS_ORIGINS=https://stencilled.me
```

#### **AMI Frontend (Vercel):**
```bash
VITE_API_URL=https://your-railway-backend-url.com
```

### **CORS Settings**
The backend needs to allow requests from `https://stencilled.me`. Update the CORS configuration in the AMI backend.

## Testing

### **Local Testing**
```bash
# Test the integration locally
./deploy-ami.sh
# Choose option 3: "Test Integration Locally"
```

### **Production Testing**
1. Deploy the AMI dashboard
2. Update the iframe URL
3. Deploy the Hugo site
4. Visit `https://stencilled.me/ami-dashboard/`

## Features

### **Responsive Design**
- Works on desktop, tablet, and mobile
- Full-screen dashboard experience
- Optimized for different screen sizes

### **Error Handling**
- Graceful fallback if dashboard fails to load
- Loading states for better UX
- Direct link to open dashboard in new tab

### **SEO Optimization**
- Proper meta tags
- Open Graph support
- Structured data for search engines

## Maintenance

### **Updating the Dashboard**
1. Make changes to the AMI dashboard code
2. Deploy to Vercel/Railway
3. Update the iframe URL if needed
4. Deploy Hugo site

### **Monitoring**
- Check Vercel/Railway logs for dashboard issues
- Monitor Hugo site deployment
- Test the integration regularly

## Troubleshooting

### **Common Issues**

#### **Dashboard Not Loading**
- Check if Vercel deployment is successful
- Verify the iframe URL is correct
- Check browser console for errors

#### **API Errors**
- Verify Railway backend is running
- Check CORS settings
- Ensure environment variables are set

#### **Hugo Build Errors**
- Check Hugo syntax in `content/ami-dashboard.md`
- Verify all required files are present
- Check Hugo version compatibility

### **Debug Commands**
```bash
# Test Hugo build locally
hugo server --bind 0.0.0.0 --port 1313

# Check AMI dashboard status
curl https://your-ami-dashboard-url.vercel.app

# Check backend API
curl https://your-railway-backend-url.com/api/health
```

## Cost Estimation

### **Free Tier:**
- **Vercel (Frontend):** Free
- **Railway (Backend):** $5/month
- **Hugo Hosting:** Free (GitHub Pages, Netlify, etc.)

### **Total:** ~$5/month

## Support

For issues with:
- **AMI Dashboard:** Check the AMI project documentation
- **Hugo Site:** Check Hugo documentation
- **Integration:** Review this README and deployment logs

## Future Enhancements

### **Potential Improvements:**
- [ ] Add analytics tracking
- [ ] Implement authentication
- [ ] Add more interactive features
- [ ] Optimize loading performance
- [ ] Add offline support

---

**Last Updated:** December 19, 2024  
**Version:** 1.0.0 