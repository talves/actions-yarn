FROM node:11

LABEL version="2.0.0"
LABEL repository="https://github.com/talves/actions-yarn"
LABEL homepage="https://github.com/talves/actions-yarn"
LABEL maintainer="Tony Alves <tony@3alves.com>"

LABEL com.github.actions.name="GitHub Action for Yarn"
LABEL com.github.actions.description="Wraps the yarn CLI to enable common yarn commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md /

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
