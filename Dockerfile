FROM node:alpine as builder
WORKDIR "/app"
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM ngix
EXPOSE 80
COPY --from=builder /app/build /usr/share/ngix/html
