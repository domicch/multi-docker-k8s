######### Builder phase ##########
FROM node:12-alpine as builder
WORKDIR '/app'
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build
# output is placed in /app/build

######### Run phase #############
FROM nginx
# essential for EBS to know which port to map
EXPOSE 3000
COPY --from=builder /app/build /usr/share/nginx/html
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
