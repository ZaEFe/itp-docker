# nginx:alpine3.21 is the base image
FROM nginx:alpine3.21 AS nginx-default
# use additional context called final-project and copy out the docs folder contents to the deafult nginx html folder: /usr/share/nginx/html
# Copy recursively the contents of the docs folder to the default nginx html folder
RUN rm -rf /usr/share/nginx/html/*
COPY --from=final-project docs/ /usr/share/nginx/html/

