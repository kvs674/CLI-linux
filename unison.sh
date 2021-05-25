# Remove current references of oCaml
apt purge ocaml
rm -r /usr/bin/ocaml*

# Remove current versions of unison binaries
apt purge unison
rm -r /usr/bin/unison
rm -r /usr/bin/unison-*

# Compile OCaml from source
mkdir -p /usr/src/ocaml
cd /usr/src/ocaml
https://caml.inria.fr/pub/distrib/ocaml-4.11/ocaml-4.11.1.tar.gz
tar xzvf ocaml-4.11.1.tar.gz --strip-components 1
./configure
make world.opt
make install
make clean

# Compile Unison from source
rm -rf /usr/src/unison/
mkdir -p /usr/src/unison/
cd /usr/src/unison/
wget https://github.com/bcpierce00/unison/releases/download/v2.51.3/unison-v2.51.3+ocaml-4.11.1+x86_64.linux.tar.gz -O unison.tar.gz
tar xzvf unison.tar.gz  --strip-components 1
make UISTYLE=text || true

chmod +x unison unison-*
ln -s $PWD/unison /usr/bin/
ln -s $PWD/unison-* /usr/bin/

unison -version
