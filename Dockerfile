FROM lqwangxg/node AS builder
WORKDIR /app
COPY package*.json /app/
RUN npm install
COPY . /app/
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
#EXPOSE 80     #EXPOSED IN nginx image
