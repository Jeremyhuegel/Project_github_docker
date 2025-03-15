FROM node:18 AS build
WORKDIR /app
COPY reactApp /app
RUN npm install && npm run build
FROM nginx:1.25
COPY default.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
