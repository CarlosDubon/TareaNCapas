PGDMP                         w            tareaNCapas    11.3    11.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    24597    tareaNCapas    DATABASE     �   CREATE DATABASE "tareaNCapas" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "tareaNCapas";
             postgres    false            �            1259    24618    empleado    TABLE     �   CREATE TABLE public.empleado (
    codigo integer NOT NULL,
    nombre character varying(50),
    edad integer,
    genero character varying(1),
    estado boolean,
    sucursal_codigo integer
);
    DROP TABLE public.empleado;
       public         postgres    false            �            1259    24616    empleado_codigo_seq    SEQUENCE     �   CREATE SEQUENCE public.empleado_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.empleado_codigo_seq;
       public       postgres    false    200                       0    0    empleado_codigo_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.empleado_codigo_seq OWNED BY public.empleado.codigo;
            public       postgres    false    199            �            1259    24610    sucursal    TABLE       CREATE TABLE public.sucursal (
    codigo integer NOT NULL,
    nombre character varying(50),
    ubicacion character varying(100),
    horario_apertura character varying(100),
    nmesas integer,
    nomgerente character varying(50),
    horario_cierre character varying(50)
);
    DROP TABLE public.sucursal;
       public         postgres    false            �            1259    24608    sucursal_codigo_seq    SEQUENCE     �   CREATE SEQUENCE public.sucursal_codigo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.sucursal_codigo_seq;
       public       postgres    false    198                       0    0    sucursal_codigo_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.sucursal_codigo_seq OWNED BY public.sucursal.codigo;
            public       postgres    false    197            �            1259    24603    usuario    TABLE     m   CREATE TABLE public.usuario (
    usuario character varying(30) NOT NULL,
    clave character varying(30)
);
    DROP TABLE public.usuario;
       public         postgres    false            �
           2604    24621    empleado codigo    DEFAULT     r   ALTER TABLE ONLY public.empleado ALTER COLUMN codigo SET DEFAULT nextval('public.empleado_codigo_seq'::regclass);
 >   ALTER TABLE public.empleado ALTER COLUMN codigo DROP DEFAULT;
       public       postgres    false    199    200    200            �
           2604    24613    sucursal codigo    DEFAULT     r   ALTER TABLE ONLY public.sucursal ALTER COLUMN codigo SET DEFAULT nextval('public.sucursal_codigo_seq'::regclass);
 >   ALTER TABLE public.sucursal ALTER COLUMN codigo DROP DEFAULT;
       public       postgres    false    197    198    198                      0    24618    empleado 
   TABLE DATA               Y   COPY public.empleado (codigo, nombre, edad, genero, estado, sucursal_codigo) FROM stdin;
    public       postgres    false    200   �                 0    24610    sucursal 
   TABLE DATA               s   COPY public.sucursal (codigo, nombre, ubicacion, horario_apertura, nmesas, nomgerente, horario_cierre) FROM stdin;
    public       postgres    false    198   �I       
          0    24603    usuario 
   TABLE DATA               1   COPY public.usuario (usuario, clave) FROM stdin;
    public       postgres    false    196   @Q                  0    0    empleado_codigo_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.empleado_codigo_seq', 1733, true);
            public       postgres    false    199                       0    0    sucursal_codigo_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.sucursal_codigo_seq', 70, true);
            public       postgres    false    197            �
           2606    24623    empleado empleado_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (codigo);
 @   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_pkey;
       public         postgres    false    200            �
           2606    24615    sucursal sucursal_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (codigo);
 @   ALTER TABLE ONLY public.sucursal DROP CONSTRAINT sucursal_pkey;
       public         postgres    false    198            �
           2606    24607    usuario usuario_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public         postgres    false    196            �
           2606    24624    empleado empleado_sucursal_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_sucursal_fkey FOREIGN KEY (sucursal_codigo) REFERENCES public.sucursal(codigo);
 I   ALTER TABLE ONLY public.empleado DROP CONSTRAINT empleado_sucursal_fkey;
       public       postgres    false    200    198    2700            �
           2606    24752    empleado sucursal    FK CONSTRAINT        ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT sucursal FOREIGN KEY (sucursal_codigo) REFERENCES public.sucursal(codigo);
 ;   ALTER TABLE ONLY public.empleado DROP CONSTRAINT sucursal;
       public       postgres    false    200    198    2700                  x�U|�v�Ȳ����Q�E�#1T/[��#�دj�I�H�Y^4���{G6��Ty)	 ��;�\��ut������q�6Ѳ��EC����X��ԍE�R��Z��[��$�?��|�k��:Ɨ��������et�����N�<X`�-J�?V�2��M�m�0�yt���9|y�w����~�v����[<�����tw�/uS�n��Ʋ�qj*|�k?���?�O�MwTM��O�kL2��pl]�3u�Mm�ڦ�a�r7�~PF_U��U��i�)��eBx8[DX�.�U��l%��8��~��Q���=���f��R3,5K�K�1�S[O�9�
�4�i��s��
���D��2l\�чN�=6��s��<z�뷷�E��j1�3�"�ĺ�����v�ݙ��ǔ/�A��&��u�rH�+0��^�Fa�U_�)��n�fg�t�&�l����/<_D������ګ#��i�&�O�luL	�!x��.a�1�]w�i���N7Vj�	��g3.��D M�r6\=d袩:m��h?��J����jR}�a�����G|z��s�(�q~0�p�@V�a�7X�ڞ�SF7���O����&*���J�Z�ˤ�$8��k����Ah�c�D�3vZuT�?�U��W��fj�i6�g�E7
̠E[Vv�9�GW{�����=B�!r&E���0D3���S�Wue��*�_E7�驌�I7�_~�ɮ���{hʹ�8{;��ѕ�u/ixp�>��	9^�ZD�ħ�p�w�k:��
����Z|w7ʊ��8�U��c��S�VV9�F���~�!�?M�zl�t�2�Z[[�����B�~1��Ͷ���Z���y~�����&�uz�`��3�9�:�[��3��>	Lʔ�?V�E�﮹�'C�$hɜ9��ӊ/U�m���P����袊��A��I&�J�c� 	t=�p�k�C������|k�)<�5DB�G�⻶oں�(Cx�h"L��*�a���5
�G��惯έ@PZ�%��)<�	�a{��0��5d��onpN~�G^b��S a@T�T��ޢ%^\�QG��/3Z>�-M�Ew-�_N��D�����G�wr�G����rYD�uyzT��:�"a'4̚��O�}��}� Е��Y��R���A�Kي��+�Q��,<"����1e�l*�n5� �3М*	ݳ�#�^�bS����ߛ
�"��F�\/�躥,���H��܋�zQD��f������m+"�ݩ�B����@p:�NuO�>�Fi�qw#N�����ؒce�]U���	�2����r�Aᦘ{R�8\�z���r	�;~U�G�>Xb �j�MUi�}[+*�=X��S7���@[�ڭ���9ft�������=Nu�,����zj1��!�Gs�"KNh=j��7�� ���>,$�gc6�Z[)��H ߜd����TXx�\c���yk��������v#�G|g*��|��8��N5��@f�ꐛ�0��/6"����I��hՋ�f��,k��U���������U������Z|�!/�����e7�W t��\@�1ه	;�����:�v� R�"�!��eO�W����?��B�L��2�����+��_��}��5��kj�B���T`q�	�_A\��5Vui@@� D�|�2)߃���4=���b*�����x��P9�%8�������Ak���Zbح54��_l;���PU%��Ǧkۃ'`o�L,hM|?��bew	��~�$b �_Ǟs�us�	�i�^��w�ۛ�/or<'���n��s~��6@��G~�a!�@e ���;r#_ ��9x;���S�q�0�3�:+z2z���(���ˡ%z��6~ �HNK0v-������P>��~���d�-�Jd�Yab��bk'��� ���r�jD=q�;~ё+�P.ܟj�轅����րtſ0
��3�+A�n!+� �7j�d�<Zr<��4��^���xρ& ���Km��0���O� JvGI']8nj�*
{��lp2�?��XWۮ}¬��]�h��R��k0�{�	��HN�Z�n��.E=A˸�i3v��$7��U��윶�ow�c�s��mȳ<����I��h�F�z�st� S7�\�s�s�e�.���N�UkkB��Lx���%��O�7�� �A�n>��I�-L��֬�g�6�ɣ��e|�>���,���ŚKg��b�g���ځ���/UU�:r����~��Ə�7}�5���`>���
9������a�{i|�P$r��������P�@����@A�6m���ob�J:�-H:�
N@q�m Kz�=���0��#���~�����"�U�r-��>|����2-,�ѫ9��n�����ڟ9M.�(8bX�&�Ґ�k'�cU.:*�����D�KP'���Ǌl�J�5�)ߋ=����z�Tu�	�,A����1���[����r!��įXi�f4H�r�1��z0p��:��[R�(O<�(A�~��M4�Z<��R[��rA�U��:ؓ�%����i6��P�R� ��u�q����t�
<�	�HO�z���%H�G�g�g���d�dl�c"�t=L��;I�:��Xⷶ���3R�U�{��n�F���J
��հ�0���cC6B	^G_�	8�	T#�c��8z|q+$��fw��1u|Uͤ��)�} ���X��t�'+n��bs	j$P�|ȑ�ޑ+�}�
�&����i��2��y'Y+�����(i2T��^�!���&aQ׆�}1ֽl��.zx�6 �
�{��G�0�SRK�����~حZQ�����U7]�l�J �E=��l��$li��jtS�&��[Ke��\u�J�e��A�.���)�C�<�S�S���=�_�i�=%`D	�r?���}LK�j	�����j�5��wF}J�#%��������vܜUؼ�z�Tp�	\�q1�[�$�	b{�oN�N�k��H1�E��q�B������_�GM���!g����8il:?�8�� ݫ�\����Y ���n�%�a����i�ܼ^W�hX��y����s��D|�2'�o��۠pR�KIƜ��5PJ��,u�g��}jl|�ATr�,��P���՟��檅�G�l"��*���]19#{��vg���d1~�H�
oEJС������z�Kx�. �k�~xފ��v��~��Zr�
�]����C��]�X�L�^I,������ �+o!� 4�j��fɛ����"��/ݛ�^�{�wɗgB���.Lӷ'o���U.�!D��}hn|�*@���|Ѝ�W�)N	N�]� Ɨp��X��� U��@������c@R�����Oa�q2�T� !N��jku�'����� 
�
� 5=x�ʭ\3�[��-x�<a/A�$��� �˶۴];���K N�dA��]�c�@�.�o��K���s*.m�
�~ mw�����z�B�I�,��ú���u�!���9���ZnR���	��M�r�(�@B�5�K�\�L���nK͠/�lUH�j~��!�3�N{�J� ���v�̧��go%��vހ ֕�Uȴp^��T�2DG
�[�oFU1��3�o����}�{}4��{���K$a���H�X�a�Ʋ>9��bAH��R��f�ѥp-��˶�܅p_�$6�E�����ONi��q��:����1�`��K���%��:��wm��7ù��pL��5����%"!!�*�������1,=�S�݁a�����X�8L H*�j��[r���Ġ`�U��x=�����C,�|���m��n������%we)Q�h�`�����Ѯ�J���q:4\�<�+Iqx�ou�[O���уhe��rM�7P+���z��4��ɳ%G�\���qXw�h0qY�9�* 1�&�<D��L�N��Wf���Ί��Ľ���ȬJ�a����1�5M��.b;1����`Ҍ0�.X�;��#�z�Q]3R6�    ����9��ެ�q�����m�q*��%���5��ܔ�����7+�P�/��N>*S���=�(���JD�S!ٌ4��{��c7��� ����$G�2���4��v��C�������j�3���쬥K�1� �g�¾ԃ�DG�D������Q �[B��A����cM�T�u8��A��C��R��^�E��z���Qz�ݑ7't���9G\�3�o�F�M���.v-�x�7���8��|��]+~���;��{K΄�p�\7��z.�l�S��S�3,䙞ڷ���t�^f.�Au�����|���16���5��+0�nU�r����>b�`���mw�k�Z�����4����7���oZ�O6s�]���V��XH�(��� ��Ow�A4##>�!{j�S�d���`0#6����^5�q�#�r����<�Id�`�^Yg��b���>�I��"�
�K��	�g����)^|9m;�0Z�m=�wm���!.降��3j�[�0ox0�Uj�b��,2?�,f� ��qa����l�O���q��D���~�-��q���}@E�S2sw��+�υ��].� ��l4�mCɅ�P�d��އ#S�&#g��iP�v��e�0��<!���9'�et���΋�B:6��R�sk5n	u�lRJƆFPو�ʇ�1�E�!?�2��#y*�g��@6 C?59�O�گ���v/�4�Y1�<�b:�ni#����9�T3����[I�z���@����@�q�����	f�d`���[چ�낃�	�n$����-�@�,�}�^� �Lj;y� ���G�D?���sE�Xn���(��L޼�~`�+�#�v[�2;N�[���)q��t�aU�J..B����^饕�`�j%GI�*q���p�$��ƹrХ���dk�.��D�d4�	IEy/T�9,pf3|��G;I���I@c�'��UE8���w�V2/ܨ5R-�-a%۽Uݎ�(Ԍ`�hW�Θ����x�'S���������2� S��_�p���r}	@a(��~~�!BJҐ��_u?��fk��(@���c��@���K����L�_P��
qF�"�Q�����%$�'T,��w�'�?H����
_�Ę�Ÿ�}���י��Peh�%����?�2��"���T͢"��>��ٟZ{�ȧ38��޽��v�(pY)��?�0�n�{[��oi#b�5���9�(r��(�Y���c�e��AƿU#�o[/q�[6du#��2��>K�:BF�nO'2�)N��e�Q�>��}��=�O�U�[�d݂�,�w��l�(�$�kJAT�̔�ˣE���:�^��#�2��$l;��+Kܼ�|H���0��a�/���ʟǓ��=��)�y��1h��y�`5`s!a��'�(8f�A竳� ����ݮ,Hnu(V�_d���nMŚB'��&˜��=l�V<�%����}W#�&x�<A(����N�tY�}۝t��ɯXTC7�l���Ⱥ�aN�YWR�c|�����'������.AVP����ԗ��s��	[fFnxG���bªĞ.�Q�.(�Q�����	X!��]=y�����e ���߅�%��[˼��!bEXNƍ~�G6۳���w���[R�RN��b5��K:�@�@�)ZL_2_OL��-W)̞uyLm��Vn�̺~�2��l	f�Q�ᾪ	P���a�5`1��bTӥOs2�2^UD����Ʊ0u17���9 s�-<(��OȻ����-A�Q�DZ�<�Ѱ��K�,��r�����W���ο[2w*,��y�!mY �%�{�n{���̔������Y�h\��)�X�u]�,�h�u0M`�z�߾$'���h�fH�s��I��*x^�5��MD���mpK���g��B1/]�%��w��S�>K��E�\J��0���!�[�_/A,o*�.�8����^������K��32�/
W��7f��/G��q	���D\�ַw�@HC�rꎑ�ב~�*8�ɂ������S$�WY�{bys�w��;Z7�Q-9̰eS�-�� �P�p8���0M�����nn+YI��H���GJ�:l��HM^X��_0�[��~(�YXmF�W�h����`T9+��8�V����|������Ț_�X�	�ݴ�_�'�eE$���Sr�K�,�t�n5k��4�%4 �_OB6�| `�_X=?��:��7�|���g�89۽%��,�����J>�HIt��w<Q�R�L�E��{=�d�B�:f�q�?:�GqvT�fM�$U|�3{0�l*��>�MjG\Ċ�$ab�S���LB,��4H�MSFl�=Ӈ�e�n/`�G�����J.�aW��HD�V����4'�V��!$��,����j^Ԑ����z�Y���k�t��'�պ ��*8�5�H�ɸ��j��ߠ�ިgE�Y+��h��{�[w+��J���lT�ucV3\u	k<_�#$�(�s����y'��S��,��f��'�U�c ~%��3N�q�����L��t���̱�����^zeL��o�,�2F�Ro���z<� ��*?���w��7�I|�So��R��s��Ó��LC�Hf����1��G�C��p��|���Abc���eh6�x�8�:�^�Rup.� �-#~=x��z)D�B�)ə��b̡��� Y�:za5~���pV�/k!��^��)TPG?���&*'PN��ˮ5��1zǎa>�y��E����1�N� i��>,ʖ��,P���ż�uZ21:�-p���ؤ��.l��'#�-��0�Z}W#Gb��������'��Ĺ#�mݒq�r��$h�E?k��污�d%�~�$���n�zi��3�6Xz�g���vV���&0���W�&Ie��9�J�`�ڷ7��/�r�`j3�ǩ�C��!�ڝ�$|���٭�6F��u_���eG�(�-6p�����7f>��G�N�g�W'3͖�[�=J�>-�'!��a�p�Ó���aĵmh�uﳫ$�ɚ��#�X��X�9�F	��`w�Zߍ9���\f��sov�A.X��5����hk����b���8ڳ	s/��m�#,I����J��O��W��g�TJ��3ܾ۶�7r��t��T�S`7I.b"VI��]Dm!y��y�ڔ�k� ��|�u(�[�( �0����5�{
���y�Z�e�y�ء}.�U��`�착UU��kL�.��s(�h��C@5�9J[�vۆMy��~��8f!��JZ?h-�?;��r!}X�)p���u����f�S�4m)��-+J�ZA�$�VSP���j{�A���@�|=�P�Pq@$���|`�:���S�)l���.�A(�@KR��]���.K2[˔<���op�z�/;_����X��x�;S,B�'M�#X*�� y�&���zPٷ7��p�O&{ �Q
z��gT�V$l2=j6!��v�/t	F`��]�8�S�r����Fج���S	*�Ńx~�{��4��J���Z�o��0	.U
d�:2T���,��Z3F�Aw�}���qa�TJ
ѠM��u����u0��U�����k2��0��[��WܮT��}��{�d�C��2�AZIx�������&۲�uOj��P�-C��$��������Κ3T�y��wj]E��i�ZQ�oTuԊ<NK���ʧ�n�-�i*�p�2f�[B��1[W�jC�if�&�)Hv9`��r�a0��|�$��@�;u:y�T��т2~�c�Ğ�X{/F˃�c��qض���qNs����'�����w���`�� 7,W�M�O���w���H=c>s����#� $�!#�
�O7��Q�98�TW�jL剚�j�M1���=H�gB4)�1�ֶ�u��2���i��{յ}R����e�
�;���%��ӽoL#�HA�n{��5$��P�(*��eM�[���Σf��]��     �Vi� �l�IZN�Zs�o���Ka��06�Y�>F
F$Uud]�8	�tU��,�f�� i�)@��k������B���j
N���%����!�e<uP�<��z�]�m��g)j��fo�y&�<Ti��OO�k���݋��j�N�]�J&�߇n�I���5-�����y��#�|�%��h�s�!z�%Yz����d#��F\6�LmՎ$D�>G�4���A�ě+�����;��IB�F
��0u5v�
U��d��Jˊ��9vR���m`��:����ݾ�l��OCYa��'&ꜭDFq���0��C5;�s܌ug�L��d�����8�p��7jŽ;W���PQ�`7�Ĩ��mm��l��l��p�FxP�C\�P�TKa$��\x��J<ixwꝑGG2cź>�E$4<��-Cz��<}�V�;�8¹��@�X�_���Q>3��L���eAn�$Jf�8	[��_H�GO�M�a&�]��k?��9eƚ�w�e��Eg�r�g"�����NX��Ty�2�d{�9�%r��oF��������C���D�-�Q��!a�O*�fp�<�I���h��?	ʚ���	
�����Ӓ��}�d�hr��O���*LBv%K��G3oQ����o��KR�nf�/��/��bsIl��Q!�$���ںa�9��xG'�(��P �M��_�o[HFw4��n45M�î�0�^`ߧ�D� (��`H��?6[d^�_��s�_N0'�7Y����A�ۊ�.��53lU����������r��Hen��Hb�N	@�t��g QI���W:�[���:.l��ʒ�,x��@_*\!��4%�M�L�2��Mi�?1A�C��z-1^F���0�ǳb	�k�i�e���+�0Xzo<2*�Q�;�0��}����xB/h"�ص��K��GQ��tP�����g�/��k?i���C�-%w���*���O6��#��y�&��H�y��$�`e"u8�ͧ�l3��5o�&nt�rn�3�L����,MnG���-!1����~t�e6.����k�;0}R�е~�g�K��?b�|��g��$Y�E?�=+fm�Qn)C|&U��6��]���O7�~W�~?�-�e	������-s,�^�	���'J鷖�0��O�L�еvj�ը�d=�9�����ФB�����h�J":c#v�^Z�$�Gy#��)d}���B%�52�R��|;~V�Kh=+ �g5��w����l�cg+v�2@u5{��9
)_^��ɣ�+��L}�	�㥽P��u���	KJ�fCj��K#&_K�X�BV����@�?����|$���N⺙>�T��t����2�8R����^���l�%����j2E�ME͵���+�un��XAR�9ʕ#
X�K���!'�y���&�_.$���r�_b���Q�)���Jz;��s�JF�AC*[�����\��	� ��у�*���\���l�d_U;*�n2�ʬ��/��_���,ζ�\Iz@
�b.s���h��J�m�r�-g����Q��a��ڢC�wE�e#P�O�m �]v���X�s+-��R��E!�K�Y�itw�^�2����&��ԍ��K��F�4e7����c�9����`����f�C%���d\�@��\'���/�@����� ��������1=�[�} ����t��ƓA�jΗ�3`��LҠEDpԕP�/�KO�NG�U��7�a��Gv�����]͉ժ|����-?;̑)~�D����w70���x̐g�p.��|ډ0E,ǑB�%)�R(iNp��m�'���y��pve�EgہW|k?�����|���1�>�'�%#�rOf�mO~?dpͫeXx��$��U�˒K��tb3�U{<	=�m^|AJz<H��m;��*l8���n۽������r	F
'��#������7�r�`x�����G��o�I9�R����������$��E'_�A0���қ�QS�M<!O���O@"�m���"�'�q���cs�O�R0.����X23v��ǹr�)l��?Bh��_�!e�\�Z@>]_�O*�P 	.��o��E;�C��uVK{�WC����BB� ���z��?�D/���	I&�����-_�P/���fE���tT�2n�ܑ�a;:8N���͠��3c�_*�ihSz�Mo�a�r�e���uh����3|'�Ci0ݹT�Ǜ�	h�����o!H�#�עg��j3�Iy���K=�z�a=�{��������\��j�L�D$S���˱��HώF!/B�'�{9Lp���-WCY(X��]{kc^І�xD���g�e��X1l �q���;'���Z��8l���s�&��axc�JF8��a��]�Ճ�橓���V��w��8w�� �� Q�����b�f��xNKqc�/���Tu{�C(�]O:_�}H.\7j���_���5�J={2���J����~⺑�u���k�_�Gm�y�!����,��^0;�oo6�r/׼/�.�E�Qw>�"��άc(��Ȣ���<\���^��5�y����H�I���<E��U������nLQ �����\�������1ا��Ȏ|&�'��Ѐ�}oYr`D>�~Qm˥�.b��
��D�x6�"�qċ��f�R���>�-��̋i$�닋R��
�*�d��1ʓ�K	hJD3T㟔�a�f?������\��"z��e�;)��P�������%��n[+9���{�J��*�<�j�NL�[�j������3�j���܏S,x�OW	\v�{I}(@��R���yGea+�p�� 	��(XFF|���?Y,?���0c�=�y3�� �hH�
0�/��2/���^��o����L���G���&��9߇-����VZS�-F��o���H
7/���;/�h�}��)=u|!wN��( 1r�r?�Ke�9Z෿$���>�JL+x���l��G�7�6��mbRW���9��1��ų{���f�mXr؆�ģ���߇��t�Di���x�8Ρ����(YУ��t�Aib��<g�+��L����_�i8�j�
yyf�:iq�|�F��`��z�r�+d��	4�Af�
�E�. :�[�f�f���d�?o]��)$֞݊�q^a
Lش��EF��s����c�)�L��v���~���t1K�-���5�>�Ax.@�$>.9��qVY�ܗ�I���ְ*��Y�T@4_<���>�%uy���6I�l��wc�g�v��Ş���O���Xvv�6�0s�pмLc�`,r��U�.l`��?/r�����8�x�9R��ܳ2�u��A�P����ۛ#PHO籌��S�4ޱ���lV2P�gUI��1���g��K���/��ǜ���-x��T���o۝ݼ# V�������o���n5Z��V��;�тk҅/$�C� ���ѵ�g��0�Gr)�4}�rSi�P�.V�������m�W&H����):dݱ��y��X-"[u�[H~���`脁C�v��n��3ڵ�
ԏ��8"���"�X.��	:���e;ǣ�І�ܺ\�we�.�h�۩��E�xa�F\�N�e�U����d۰�Cf���^�ݰ����İ]nWP{-�XĿ�u�|�k���˝��(���kSL�C:Hۙ���>&��d�:�>���})����wr&�)B�:��8��bwө�$F8'5�:�����F�Jg T��31u���!4	�l���qi'O�/lw M�k{V�m�Ɏzm/%60:�:Z���R����(��G�o����w�./�w<��VIu��t�L��g_i'�$q1*��N�	ݤ��ba����w���mɱe��1qGe��$�n{�i:O��V8e���Ew����|�V�, 
^ E���R綻��24s�V�B̢�}{ӡ)V�Vѕ��/;��d��
�Ζ����e�`)l �:vr��+��B@�x�j�����h�\FOZ�M����}����"5�ї�pF�A�U��;^\�2`Ӷ�h��/ �   J��eﱴ#�7�;�l��AP�]=�w�k��dV��z��?It�m�i����3zJ��jx�l�V���U��̡���p�-Ϗ-�j�y�YӸ�0w��QO5����l�3�����>�ܡM^�j���j��ۦ�����U¼�{K�f�{�8�������L9d&         |  x���Iw#���Y�7_$��ݸ��w�T��<���`(�]�� �Vkf��*32�K4���;cs��W-��͞ҪH��m��*���*�SZȵ`�μ
CIu��QӃ�]��Ԥy�亓���U('��H3J���0��:�(i.�$J�j#��#7[\[�E��F�W)l��pISYѽC߹����*JR�s=��FYܐ�+�63�Z�68�5��P��}��}F	Jj�%9����M{(��_�I���N؃�>��l7�g9qMeN��Ur6�h����QR@��QkJ��as�C+���7!�ڷ1�JI��6(�/�8JJ�"��矴��5�r3�~���~qNU�/���%7�o")���+��Z����0�?��%�J+Q�5�Z����=g�N���C�����
��4�*v͕�zl&��gtgT$�^ah�E����H1��&����}��B��c�p�{�u�2v�z+������-����40��t^�$�Ҙ�������~Fy�$��x%��)h&z�7��/��?��҄z%��>��I�C$;T�ȭ�$�]Z�y�1�a�^�_Oa���hӞ�r�ս�J*�c:�f(/�_�s�Z��JS�wh7ԟD0��`4��`-��jx�%T�0�\i	�F�w��9��;��^Nˋ,ɽ��?Q��\r%v�aS�[�C@�,JzZw�y W�ʭ>���,oj4d���J���ܴb{����oM
�^���팽�}�̱U*������1Ab��._o�@q�=k�p���g��VP^���w�1E�
f)i�W��[����e5=m%��� �U|8a���p�<pهҎ��X��H�ɮ�&�++�V^|���R(}��&f˕�6���wBx
lˢ,��Ů���S��ހ�՝�Y�B�*�[��b;���Q��W�z�N�D����7�Z6�f�{�9`�����6������yY���KP����=�H;qm�Tbུ�}�����:�ž�*��d˒8g�����jӀڙ�(�p�b��(�11w>�L��2���:��(�������h򚏭�4F?�/Y��-O��+�`S�P]�7��,+L4N���Yg���&ְ�� +%U�;��y�>�&EIb�>���{߯�\a7�{�]�S>����a����ށEFUk��8lT�V����TG�a#fH4�i��.�@~!C�5�Rv��\�{��e��'�[���=0)R~�8��:x4�_TV.���;�ހ���2ʛ��� ��~J@<'[+z�݈dvl"`v����Xհ9����^��;m��:��/�����
=�6i�ͫ������E+���,��؋p8/��/��M<��ϒ�1�J��䞨������~����pC'�O�
����:9m&O_*R�DΎ�仭T!Ry���Vo���r��a��$;^��t`���<�E��2Ͽwz��d�?9$�[O4���4s����#� jE|����O���Xj�͝�pu&Q���RA4��`��0�ݪ����0��c��8I�Z�5gw@j�}�{�Ngؒr��Up�E��@e�!JO���+����o�r��m��'w���s���љSIY���'�+��+�Ʉ4yh���5���//3<̌\o}��%Ǜ�����X�4I��G���Y���An�f3l7> �X��������Ŕ���Us���2X�eO�9�o�����C��4܀�{���x�����l�A	l�{��o)�$�����Tn�q���dq����~���(.�AP���΀h�77��lBqj����e����σ��ٚ�g��\U�u��FQ��|�J      
      x�KL����L�\1z\\\ 4�     