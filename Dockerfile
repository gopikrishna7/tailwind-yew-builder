# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /work

# Install necessary tools and packages


# Install tailwindcss and other npm packages globally
RUN npm install --global tailwindcss@1.9.6 tailwindcss-cli@latest postcss@8.4.14 autoprefixer@9.8.8 clean-css-cli@5.5.0 npm-run@latest

# Copy necessary files into the container
COPY package.json .
COPY postcss.config.js .
COPY prod.sh .

# Install tailwindcss-cli globally (if needed)
RUN npx tailwindcss-cli@latest

# Where the input tailwind.css file can be found
VOLUME /work/input

# Where the final CSS will be output
VOLUME /work/output

# Where postcss will search for src to remove unused tailwind bits
# Point this to the root of your base app
VOLUME /work/source_code
