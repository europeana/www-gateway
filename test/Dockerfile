FROM postman/newman

COPY postman_*.json /etc/newman/

CMD ["run", "postman_collection.json", "--ignore-redirects", "--environment", "postman_environment.json"]
