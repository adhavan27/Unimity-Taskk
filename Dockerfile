FROM node
WORKDIR /app
COPY . . 
RUN npm install
RUN chmod +x ./scripts/runApp.sh
RUN npm start
EXPOSE 9981
CMD ["node","app.js"]
