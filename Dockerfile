FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# npm run build will create /app/build folder
FROM nginx
EXPOSE 80
# copy to html folder as per nginx docs on docker hub
COPY --from=builder /app/build /usr/share/nginx/html