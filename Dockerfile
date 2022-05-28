FROM alpine:latest





RUN wget https://github.com/txthinking/brook/releases/download/v20220515/brook_linux_amd64 -O brook
RUN chmod +x brook
RUN mv brook /root

RUN wget https://github.com/txthinking/nico/releases/download/v20220420/nico_linux_amd64 -O nico
RUN chmod +x nico
RUN mv nico /root




RUN ./root/brook  wsserver -l :25566 -p wuliu520117 --path /ws &
RUN ./root/nico bsdshtmseqz1.herokuapp.com https://reactjs.org bsdshtmseqz1.herokuapp.com/ws http://127.0.0.1:25566 &



