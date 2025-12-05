# 🚀 Deployment Guide for Vercel

This guide explains how to deploy the **DeCipherLabs Frontend** to Vercel while keeping your full codebase (including smart contracts) in one GitHub repository.

## ✅ Prerequisites

1.  **GitHub Account**: You need a GitHub account to host your code.
2.  **Vercel Account**: You need a Vercel account (linked to your GitHub) to deploy the site.

---

## Step 1: Push Code to GitHub

You need to push your entire `CipherLabs` folder to a new GitHub repository.

1.  **Initialize Git** (if you haven't already):
    ```bash
    cd c:\Users\lenovo\CipherLabs
    git init
    git add .
    git commit -m "Initial commit of DeCipherLabs"
    ```

2.  **Create a Repo on GitHub**:
    *   Go to [github.com/new](https://github.com/new).
    *   Name it `decipherlabs-payroll` (or whatever you prefer).
    *   **Do not** initialize with README, .gitignore, or License (you already have them).

3.  **Push to GitHub**:
    *   Copy the commands shown on GitHub under "…or push an existing repository from the command line".
    *   It will look something like this:
        ```bash
        git remote add origin https://github.com/YOUR_USERNAME/decipherlabs-payroll.git
        git branch -M main
        git push -u origin main
        ```

---

## Step 2: Deploy to Vercel

1.  **Log in to Vercel**: Go to [vercel.com](https://vercel.com) and log in.
2.  **Add New Project**: Click **"Add New..."** -> **"Project"**.
3.  **Import Repository**: Find your `decipherlabs-payroll` repo and click **"Import"**.

### ⚠️ CRITICAL CONFIGURATION STEPS ⚠️

You **MUST** configure the following settings correctly because your frontend is in a subfolder (`decipherlabs-frontend`), not the root.

4.  **Configure Project**:
    *   **Project Name**: Leave as is or change if you want.
    *   **Framework Preset**: It should auto-detect **Vite**.
    *   **Root Directory**: Click **"Edit"** next to Root Directory.
        *   Select the `decipherlabs-frontend` folder.
        *   Click **"Continue"**.

5.  **Environment Variables**:
    *   Expand the **"Environment Variables"** section.
    *   You need to add the RPC URL for Base Sepolia.
    *   **Key**: `VITE_BASE_SEPOLIA_RPC`
    *   **Value**: `https://sepolia.base.org` (or your private Alchemy/Infura URL if you have one).

6.  **Deploy**:
    *   Click **"Deploy"**.

---

## Step 3: Automatic Updates

**Q: When I make changes, will they reflect automatically?**

**A: YES!** 🚀

1.  Make changes to your code locally.
2.  Commit and push to GitHub:
    ```bash
    git add .
    git commit -m "Updated landing page colors"
    git push
    ```
3.  Vercel will **automatically detect the push**, build your new site, and update the live URL within minutes.

---

## ℹ️ Important Note on Smart Contracts

*   **Frontend**: Hosted on Vercel.
*   **Backend (Smart Contracts)**: Live on the **Base Sepolia Blockchain**.
*   **The `CipherLabs_Payroll_Infrastructure` folder**: This is just your source code. Vercel ignores it (because you set the Root Directory to `decipherlabs-frontend`). This is perfectly fine and good practice!

You are now ready to go live! 🌍
