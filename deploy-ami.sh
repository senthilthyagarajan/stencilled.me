#!/bin/bash

echo "🚀 AMI Dashboard Integration Script for stencilled.me"
echo "===================================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the right directory
if [ ! -f "config.toml" ]; then
    print_error "Please run this script from the stencilled.me project root directory"
    exit 1
fi

# Function to deploy AMI dashboard to Vercel
deploy_ami_dashboard() {
    print_status "Deploying AMI Dashboard to Vercel..."
    
    # Navigate to AMI dashboard directory
    cd /Users/senthil/Desktop/genbi-analytics/frontend
    
    # Check if Vercel CLI is installed
    if ! command -v vercel &> /dev/null; then
        print_status "Installing Vercel CLI..."
        npm install -g vercel
    fi
    
    # Deploy to Vercel
    print_status "Deploying to Vercel..."
    vercel --prod --yes
    
    # Get the deployment URL
    AMI_URL=$(vercel ls | grep "ami-dashboard" | head -1 | awk '{print $2}')
    
    if [ -z "$AMI_URL" ]; then
        AMI_URL="https://ami-dashboard.vercel.app"
    fi
    
    print_success "AMI Dashboard deployed to: $AMI_URL"
    
    # Update the iframe URL in the Hugo content
    cd /Users/senthil/Desktop/New\ Folder\ With\ Items/stencilled.me-master
    
    # Update the iframe src in the content file
    sed -i '' "s|src=\"https://ami-dashboard.vercel.app\"|src=\"$AMI_URL\"|g" content/ami-dashboard.md
    
    print_success "Updated iframe URL to: $AMI_URL"
    
    cd /Users/senthil/Desktop/New\ Folder\ With\ Items/stencilled.me-master
}

# Function to deploy backend to Railway
deploy_ami_backend() {
    print_status "Deploying AMI Backend to Railway..."
    
    # Navigate to AMI backend directory
    cd /Users/senthil/Desktop/genbi-analytics/backend
    
    # Check if Railway CLI is installed
    if ! command -v railway &> /dev/null; then
        print_status "Installing Railway CLI..."
        npm install -g @railway/cli
    fi
    
    # Deploy to Railway
    print_status "Deploying backend to Railway..."
    railway up
    
    print_success "AMI Backend deployed to Railway"
    
    cd /Users/senthil/Desktop/New\ Folder\ With\ Items/stencilled.me-master
}

# Function to build and deploy Hugo site
deploy_hugo_site() {
    print_status "Building Hugo site..."
    
    # Build the Hugo site
    hugo --minify
    
    if [ $? -eq 0 ]; then
        print_success "Hugo site built successfully"
    else
        print_error "Failed to build Hugo site"
        exit 1
    fi
    
    print_status "Deploying Hugo site..."
    
    # Check if this is a git repository
    if [ -d ".git" ]; then
        # Commit and push changes
        git add .
        git commit -m "Add AMI Dashboard integration"
        git push
        
        print_success "Hugo site deployed via Git"
    else
        print_warning "Not a git repository. Please deploy manually."
        print_status "You can deploy by running: hugo --minify"
    fi
}

# Function to test the integration
test_integration() {
    print_status "Testing AMI Dashboard integration..."
    
    # Build Hugo site locally
    hugo server --bind 0.0.0.0 --port 1313 &
    HUGO_PID=$!
    
    # Wait for Hugo to start
    sleep 3
    
    # Test the AMI dashboard page
    if curl -s http://localhost:1313/ami-dashboard/ > /dev/null; then
        print_success "AMI Dashboard page is accessible"
    else
        print_error "AMI Dashboard page is not accessible"
    fi
    
    # Kill Hugo server
    kill $HUGO_PID
    
    print_success "Integration test completed"
}

# Main menu
echo ""
echo "Choose deployment option:"
echo "1) Deploy AMI Dashboard (Frontend + Backend)"
echo "2) Deploy AMI Dashboard + Hugo Site"
echo "3) Test Integration Locally"
echo "4) Deploy Hugo Site Only"
echo "5) Exit"
echo ""

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        deploy_ami_dashboard
        deploy_ami_backend
        ;;
    2)
        deploy_ami_dashboard
        deploy_ami_backend
        deploy_hugo_site
        ;;
    3)
        test_integration
        ;;
    4)
        deploy_hugo_site
        ;;
    5)
        print_status "Goodbye!"
        exit 0
        ;;
    *)
        print_error "Invalid choice. Please run the script again."
        exit 1
        ;;
esac

echo ""
print_success "AMI Dashboard integration completed!"
print_status "Your AMI Dashboard will be available at: https://stencilled.me/ami-dashboard/"
print_status "Check DEPLOYMENT.md in the AMI project for detailed instructions" 