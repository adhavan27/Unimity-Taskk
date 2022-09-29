FROM node
WORKDIR /app
COPY . . 
RUN npm install
RUN chmod +x ./scripts/runApp.sh
EXPOSE 9981
CMD ["node","app.js"]
