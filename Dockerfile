FROM node
WORKDIR /app
COPY . . 
RUN npm install && npm start 
RUN chmod +x ./scripts/runApp.sh
EXPOSE 9981
CMD ["node","app.js"]
