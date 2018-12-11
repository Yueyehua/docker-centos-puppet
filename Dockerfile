FROM centos:7
MAINTAINER Richard Delaplace "rdelaplace@yueyehua.net"
LABEL version="1.0.0"

ENV \
  BUSSER_ROOT="/tmp/verifier" \
  GEM_HOME="/tmp/verifier/gems" \
  GEM_CACHE="/tmp/verifier/gems/cache" \
  GEM_PATH="/tmp/verifier/gems:${GEM_PATH}"

# Install puppet with lint tools
RUN \
  rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm && \
  yum -y install \
    curl \
    epel-release \
    redhat-lsb \
    ruby \
    rubygems \
    rubygems-puppet-lint \
    tar \
    sudo && \
  yum clean all;

ARG \
  GEM_OPTS=' \
    -q \
    --bindir /tmp/verifier/bin \
    --no-rdoc \
    --no-ri \
    --no-format-executable \
    --no-user-install'

# Install gems
RUN \
  mkdir -p /tmp/verifier/bin && \
  gem install $GEM_OPTS puppet --version 4.10.12 && \
  gem install $GEM_OPTS busser --version 0.7.1 && \
  gem install $GEM_OPTS busser-serverspec --version 0.5.10 && \
  gem install $GEM_OPTS net-ssh --version 4.2.0 && \
  gem install $GEM_OPTS public_suffix --version 2.0.5 && \
  gem install $GEM_OPTS rake --version 12.3.1 && \
  gem install $GEM_OPTS serverspec --version 2.41.3 && \
  gem install $GEM_OPTS librarian-puppet --version 3.0.0 && \
  gem install $GEM_OPTS webmock --version 3.4.2;
