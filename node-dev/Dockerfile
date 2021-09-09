FROM node:14

# RUN apt-get install zlib1g-dev
# RUN wget http://prdownloads.sourceforge.net/libpng/libpng-1.5.4.tar.gz
# RUN tar xzf libpng-1.5.4.tar.gz
# RUN cd libpng-1.5.4 && ./configure --prefix=/usr/local/libpng && make && make install
# RUN ln -s /usr/local/libpng/lib/libpng15.so.15 /usr/lib/libpng15.so.15 
RUN apt-get update
RUN apt-get install -y build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev
RUN npm i --global canvas --build-from-source
