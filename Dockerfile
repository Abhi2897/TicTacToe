From node:18-alpine As build 
Workdir /app
Copy package*.jason
Run npm install 
Copy . .
Run npm run build 

From nginx:alpine
Copy --from=build /app/dist /usr/share/nginx/html
Expose 80
CMD ["nginx", "-g", "daemon off;"]