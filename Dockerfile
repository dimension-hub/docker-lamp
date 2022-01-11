FROM ubuntu:20.04

# # Arguments defined in docker-compose.yml
# ARG user
# ARG uid

# Install system dependencies
# ENV DEBIAN_FRONTEND=noninteractive
# RUN apt-get update -y && apt-get install -y \
#     software-properties-common \
#     wget curl \
#     git vim \
#     zip unzip \
#     cowsay lolcat

# # Install PHP and SMILE extensions
# RUN wget http://smilebuntu.vitry.intranet/smile-depot.gpg -O /tmp/smile-depot.gpg && \
#     apt-key add /tmp/smile-depot.gpg
# RUN echo "deb http://smilebuntu.vitry.intranet/depot smilebuntu main" > /etc/apt/sources.list.d/smile.list
# RUN apt-get update -y && apt-get install -y \
#     php7.4 \
#     php7.4-dev \
#     php7.4-cli \
#     php7.4-zip \
#     php7.4-mysql \
#     php7.4-gd \
#     libapache2-mod-php \
#     php7.4-curl \
#     php7.4-xml \
#     php7.4-bcmath \
#     php7.4-json \
#     php7.4-common \
#     php7.4-mbstring

# Install Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Get latest Composer
# COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Create user
RUN useradd -ms /bin/bash smile
USER smile
WORKDIR /home/smile

# # Create system user to run Composer and Artisan Commands
# RUN useradd -G www-data,root -u $uid -d /home/$user $user
# RUN mkdir -p /home/$user/.composer && \
#     chown -R $user:$user /home/$user

# # Set working directory
# WORKDIR /var/www

# USER $user

# CMD ["df -h / | tee >(cat /etc/os-release) >(free -h) | cowsay -f duck | lolcat"]