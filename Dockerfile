# Multistage process
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json ./ 
RUN npm install
COPY . . 
RUN npm run build

# Next stage
FROM nginx
# used by elastic-beanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# nginx starts automatically - no commmand required

