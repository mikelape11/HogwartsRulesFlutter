import 'package:flutter_color/flutter_color.dart';
import 'package:stream_chat/stream_chat.dart';

// //DATOS USUARIO
// String ip = "http://52.166.205.229:8080/HogwartsRulesAPI";
// //52.166.205.229
// //http://10.0.2.2:8080
// String ipLocal = "http://10.0.2.2:8080";
String idUsuario = "";
String usuario = "";
bool conexion = false;
StreamChatClient cliente;
String password = "";
String email = "";
String casaHogwarts = "";
String varita = "";
String patronus = "";
String idEleccionCasa = "";
int puntosGry = 0;
int puntosSly = 0;
int puntosHuff = 0;
int puntosRav = 0;
String avatarDefecto = "images/Avatares/Avatar7.png";
String avatarElegido = "";
int numeroUsuario = 0;
//COLORES LOGIN Y REGISTRO

// int color1 = 0xFF171717;
// int color2 = 0xFFb37f1c;
// int color3 = 0xFFb37f1c;
// int color4 = 0xFF252525;

int color1 = 0xFF171717;
int color2 = 0xFFDDDDDD;
int color3 = 0xFFAAAAAA;
int color4 = 0xFF252525;

//COLORES DE LAS CASAS
HexColor gryPrincipal = HexColor('#551617');
HexColor grySecundario = HexColor('#ff9800');
HexColor gryTerciario = HexColor('#ffb400');

HexColor slyPrincipal = HexColor('#09473e');
HexColor slySecundario = HexColor('#b0b0b0');
HexColor slyTerciario = HexColor('#d9d9d9');

HexColor ravPrincipal = HexColor('#0e1a40');
HexColor ravSecundario = HexColor('#946b2d');
HexColor ravTerciario = HexColor('#cc8212');

HexColor hufPrincipal = HexColor('#9c6c21');
HexColor hufSecundario = HexColor('#050505');
HexColor hufTerciario = HexColor('#151515');

//LOGOS DE LAS CASAS
String logoGry = "images/Gryffindor/LogoGry.png";
String logoSly = "images/Slytherin/LogoSly.png";
String logoRav = "images/Ravenclaw/LogoRav.png";
String logoHuf = "images/Hufflepuff/LogoHuf.png";

//FONDOS DE LAS CASAS
String fondoGry = "images/Gryffindor/gryffindor.png";
String fondoSly = "images/Slytherin/slytherin.png";
String fondoRav = "images/Ravenclaw/ravenclaw.png";
String fondoHuf = "images/Hufflepuff/hufflepuff1.png";
String fondoNegro = "images/fondoNegro.png";
String fondoNegro2 = "images/fondoNegro2.png";
String fondoNegro3 = "images/fondoNegro3.png";
String fondoTestGry = "images/TestVaritaPatronus/gryffindor.jpg";
String fondoTestSly = "images/TestVaritaPatronus/slytherin.jpg";
String fondoTestRav = "images/TestVaritaPatronus/ravenclaw.jpg";
String fondoTestHuf = "images/TestVaritaPatronus/hufflepuff.jpg";

//FOTOS DE CADA PERSONAJE POR CASA
String personajeGry1 = "images/Gryffindor/Gry1.png";
String personajeGry2 = "images/Gryffindor/Gry2.png";
String personajeGry3 = "images/Gryffindor/Gry3.png";

String personajeSly1 = "images/Slytherin/Sly1.png";
String personajeSly2 = "images/Slytherin/Sly2.png";
String personajeSly3 = "images/Slytherin/Sly3.png";

String personajeRav1 = "images/Ravenclaw/Rav1.png";
String personajeRav2 = "images/Ravenclaw/Rav2.png";
String personajeRav3 = "images/Ravenclaw/Rav3.png";

String personajeHuf1 = "images/Hufflepuff/Huf1.png";
String personajeHuf2 = "images/Hufflepuff/Huf2.png";
String personajeHuf3 = "images/Hufflepuff/Huf3.png";

//FONDOS DE CADA PERSONAJE POR CASA
String fondoPersonajeGry = "images/Gryffindor/gryffindor2.png";
String fondoPersonajeSly = "images/Slytherin/slytherin2.png";
String fondoPersonajeRav = "images/Ravenclaw/ravenclaw2.png";
String fondoPersonajeHuf = "images/Hufflepuff/hufflepuff2.png";

//INFO DE CADA CASA
String infoGry =
    "Caracter??sticas: coraje y valent??a. Un buen miembro de Gryffindor tiene gran osad??a, temple y caballerosidad. Son capaces de todo por defender en lo que creen y nunca se dan por vencidos. Tambi??n son capaces de romper las reglas si es necesario y les encantan los retos, cuanto m??s dif??ciles, mejor.";
String infoSly =
    "Cualidades. Los Slytherin tienden a ser l??deres ambiciosos, astutos y fuertes, orientados a los logros. ... Seg??n Albus Dumbledore, las cualidades que Salazar valoraba en los estudiantes que hab??a elegido inclu??an inteligencia, ingenio, determinaci??n y 'un cierto desd??n por las reglas'.";
String infoRav =
    "Ravenclaw es una de las cuatro casas en las que se dividen los estudiantes del Colegio Hogwarts de Magia y Hechicer??a en el universo de los libros y pel??culas de Harry Potter. Esta casa fue fundada por Rowena Ravenclaw y solo son escogidas personas inteligentes, creativas y sabias.";
String infoHuf =
    "Hufflepuff es la m??s inclusiva de las cuatro casas; el trabajo duro, la paciencia, la amistad y la honestidad son sumamente necesarias para ser miembros. Su animal emblem??tico es el tej??n y sus colores son el amarillo y negro. Hufflepuff responde en gran medida a los elementos de la tierra.";

//INFO PERSONAJES DE CADA CASA
String infoPersonajeGry1 =
    "Harry James Potter, es el personaje principal de la serie de libros creada por la autora JK Rowling. Su historia se desarrolla en la Escuela Hogwarts de Magia y Hechicer??a, junto a sus mejores amigos, Ron Weasley y Hermione Granger. Su caracter??stica f??sica m??s intrigante, es una cicatriz con forma de rel??mpago en su frente, la cual obtuvo cuando el Mago Oscuro Lord Voldemort intent?? asesinarlo cuando s??lo era un beb?? de 1 a??o de edad, mediante la maldici??n asesina, Avada Kedavra. Voldemort asesin?? a los padres de Harry y destruy?? su hogar la noche del 31 de Octubre de 1981. Harry es famoso dentro del mundo m??gico, por ser la ??nica persona que ha sobrevivido al Avada Kedavra, causando la ca??da de Lord Voldemort.";
String infoPersonajeGry2 =
    "Hermione Jean Granger es una de las mejores amigas de Harry Potter y Ron Weasley. Debido a su fecha de nacimiento, Hermione es la mayor de sus compa??eros, pues la mayor??a de ellos nacieron a finales de 1979/1980. Ya que Hogwarts s??lo acepta estudiantes de primer a??o que hayan cumplido 11 a??os antes del comienzo del a??o escolar el 01 de Septiembre, Hermione ser??a muy joven para unirse a la promoci??n anterior. Ella demuestra una considerable destreza acad??mica, en comparaci??n con sus amigos y compa??eros, pero carece de madurez emocional. Constantemente responde negativamente a las provocaciones de Ron, pues generalmente no soporta quedar como ignorante o permitir que sus amigos hagan el rid??culo.";
String infoPersonajeGry3 =
    "Ronald Bilius ??Ron?? Weasley apareci?? por primera vez en Harry Potter y la Piedra Filosofal, y es el mejor amigo de Harry Potter. Ron es un personaje que contrasta con Harry, pues usualmente recibe poca participaci??n, mientras que Harry casi siempre es el centro de atenci??n. En ocasiones, esto crea desavenencias entre los dos amigos. Ya que en Hogwarts ??l est?? en la misma casa que Harry, Gryffindor, Ron est?? presente en la mayor??a de situaciones de la serie.";

String infoPersonajeSly1 =
    "Draco Malfoy es un alumno de Slytherin del Colegio Hogwarts de Magia y Hechicer??a. Naci?? el 5 de junio de 1980. Se caracteriza por ser arrogante y hablar arrastrando las palabras. Insulta continuamente a los nacidos de muggles (sangres sucia) o a los que ??l considera que no est??n a su altura. Demuestra estar orgulloso de proceder de una familia de sangre pura. Es hijo de Lucius Malfoy, mort??fago a las ??rdenes de Lord Voldemort. Tiene el pelo rubio platino y los ojos grises. Suele ir acompa??ado por Crabbe y Goyle, de su mismo curso. En su primer a??o en Hogwarts, Draco le ofrece a Harry Potter ser su amigo, pero ??ste lo rechaza, y desde entoncesforjan un desprecio mutuo.";
String infoPersonajeSly2 =
    "Severus Snape Prince, es el profesor de Pociones (y de Defensa Contra las Artes Oscuras en Harry Potter y el Misterio del Pr??ncipe) el Colegio Hogwarts de Magia y Hechicer??a. Tambi??n es jefe de la casa Slytherin. Tiene un sentido del humor bastante sarc??stico, y siempre quiere ridiculizar a los alumnos de otras casas, en especial a Harry Potter, a quien odia, debido a que le recuerda a James Potter, padre de ??ste, de quien fue su enemigo durante su etapa de estudiante. Su aspecto es el de un mago alto, muy delgado, de piel cetrina, dientes torcidos y nariz aguile??a. Su cabello es negro al igual que sus ojos, largo y grasiento. Viste siempre de negro. Muchas veces se le compara con un murci??lago.";
String infoPersonajeSly3 =
    "Lord Voldemort es el archi-villano del protagonista de la saga, Harry Potter. A lo largo de la serie, se le describe constantemente como un Mago Tenebroso obsesionado con el poder y la inmortalidad. Tambi??n siente un odio genocida hacia los humanos carentes de magia. En todos los libros, su nombre es tan temido que muchos magos se niegan a pronunciarlo. La mayor??a de los personajes lo llaman solo como ??Ya-Sabes-Quien???, o ???El-Que-No-Debe-Ser-Nombrado???. Con excepci??n de Harry Potter y el Prisionero de Azkaban, Voldemort ha aparecido en todos los libros de Harry Potter, ya sea en persona o en alguna manifestaci??n m??gica.";

String infoPersonajeRav1 =
    "Luna Lovegood es una alumna de Ravenclaw del colegio Hogwarts de Magia y Hechicer??a. Se la caracteriza por tener una personalidad indiferente. Siempre est?? en su mundo y le da igual lo que la gente piense de ella. Tiene ideas disparatadas que nadie comparte, pero que ella asegura que son firmes (como por ejemplo, asegura que los snorkacks de cuernos arrugados existen). Es hija de Xenophilius Lovegood, editor de El Quisquilloso, que comparte las mismas extravagantes ideas que su hija. Su madre muri?? en consecuencia de un experimente fallido.";
String infoPersonajeRav2 =
    "La Profesora Sybill Patricia Trelawney (nacida antes de 1963) era una bruja y profesora de Adivinaci??n, junto a Firenze, en el Colegio Hogwarts de Magia y Hechicer??a. La tataranieta de la c??lebre vidente Cassandra Trelawney. Fue Trelawney quien hizo la profec??a acerca de Voldemort y el que tiene el poder para vencerlo (Voldemort eligi?? como mayor amenaza a Harry Potter), durante su entrevista de trabajo con Albus Dumbledore. Al final del a??o escolar 1993-1994, predijo con exactitud el escape de Peter Pettigrew y el regreso de Lord Voldemort.";
String infoPersonajeRav3 =
    "Cho Chang fue una bruja que asisti?? al Colegio Hogwarts de Magia y Hechicer??a desde 1990 a 1997 y fue elegida para la Casa de Ravenclaw. Fue Buscadora del equipo de Quidditch de su casa y una estudiante popular. En quinto a??o de Cho, ella comenz?? a salir con Cedric Diggory mientras era Campe??n en el Torneo de los Tres Magos. Cedric se convirti?? en una de las primeras bajas de la Segunda Guerra M??gica. Fue asesinado por Peter Pettigrew por orden de Lord Voldemort en junio de 1995. Su muerte hiri?? enormemente a Cho y la hizo decidida a luchar contra el recientemente devuelto Se??or Tenebroso.";

String infoPersonajeHuf1 =
    "Nymphadora Tonks m??s com??nmente conocida como Tonks, ocasionalmente Dora, era una bruja mestiza y la ??nica hija de Ted y Andr??meda Tonks (de soltera Black). Ella era metamorfomaga y asisti?? al Colegio Hogwarts de Magia y Hechicer??a desde 1984 hasta 1991. Fue clasificada en Hufflepuff y estuvo en el mismo a??o en Hogwarts que el Gryffindor Charlie Weasley. Despu??s de dejar Hogwarts, Tonks se uni?? al Ministerio de Magia y se entren?? para convertirse en una Auror bajo la atenta mirada de Alastor Moody, calificando en 1994.";
String infoPersonajeHuf2 =
    "Newton Artemis Fido Scamander, (Orden de Merl??n Segunda Clase), (n. 24 de febrero de 1897) era un famoso Magizoologista y autor de Animales fant??sticos y d??nde encontrarlos. A??n desde peque??o Scamander desarroll?? un inter??s en las criaturas m??gicas, influenciado por la cr??a de hipogrifos de su madre. ??l asisti?? al Colegio Hogwarts de Magia y Hechicer??a, donde fue seleccionado para la casa Hufflepuff y m??s tarde expulsado. Scamander se uni?? al Ministerio de Magia, donde pas?? dos a??os en la Oficina de Realojamiento de Elfos Dom??sticos antes de unirse a la Divisi??n de Bestias. En 1918, ??l fue contratado por Augustus Worme de Libros Oscuros para escribir Animales fant??sticos y d??nde encontrarlos.";
String infoPersonajeHuf3 =
    "Cedric Diggory (septiembre/octubre de 1977 ??? 24 de junio de 1995) fue el hijo de Amos Diggory y su esposa. Comenz?? a asistir al Colegio Hogwarts de Magia y Hechicer??a en 1989, y fue seleccionado para la casa Hufflepuff. Durante su estancia en el colegio fue prefecto y capit??n del equipo de Quidditch de Hufflepuff, jugando como buscador. En su sexto a??o Cedric puso su nombre para competir en el Torneo de los Tres Magos. Fue seleccionado como campe??n de Hogwarts y, aunque fue opacado en la prensa por Harry Potter, Cedric disfrut?? casi del mismo apoyo del cuerpo estudiantil y luego de las primeras dos pruebas qued?? empatado con Harry en el primer lugar. Cedric y Harry completaron el la tercera prueba juntos.";

//SINOPSIS PELICULAS
String pelicula1 =
    "El d??a de su cumplea??os, Harry Potter descubre que es hijo de dos conocidos hechiceros, de los que ha heredado poderes m??gicos. Debe asistir a una famosa escuela de magia y hechicer??a, donde entabla una amistad con dos j??venes que se convertir??n en sus compa??eros de aventura. Durante su primer a??o en Hogwarts, descubre que un mal??volo y poderoso mago llamado Voldemort est?? en busca de una piedra filosofal que alarga la vida de quien la posee.";
String pelicula2 =
    "El joven mago Harry Potter, Ron Weasley y Hermione Granger se enfrentan a nuevos retos. Durante su segundo a??o en el Colegio Hogwarts de Magia y Hechicer??a, estos jovencitos intentan descubrir una fuerza oscura que esta aterrorizando al Colegio. Despu??s de un largo verano, Harry Potter vuelve a la escuela donde de pronto empezar?? a preocuparse por la supervivencia, cuando cosas terribles comienzan a pasarle a ??l y a sus compa??eros. Misteriosamente, palabras escritas sobre la pared brillan advirtiendo que 'la c??mara secreta ha sido abierta'.";
String pelicula3 =
    "En su tercer a??o en Hogwarts, Harry, Ron y Hermione conocen a Sirius Black, el prisionero que ha escapado de Azkaban y aprenden a acercarse a un Hippogriffo mitad caballo/ mitad ??guila, a como transformar a los cambiantes Boggarts y el arte de la Adivinaci??n. Harry deber?? enfrent??rse a los Dementores que son ladrones de almas, defenderse del peligroso hombre lobo y lidiar con la verdad acerca de la relaci??n entre Sirius Black y sus padres.";
String pelicula4 =
    "Cuando el nombre de Harry Potter emerge del C??liz de Fuego, se convierte en un competidor en una batalla agotadora por la gloria entre tres colegios de magos ??? El Torneo de los Tres Magos. Pero ya que Harry nunca present?? su nombre para El Torneo, ??qui??n lo hizo? Ahora Harry debe enfrentar a un drag??n infalible, demonios acu??ticos feroces y un laberinto encantado, solamente para encontrarse con el cruel descubrimiento de El Quien No Debe Ser Nombrado.";
String pelicula5 =
    "Harry Potter regresa por quinto a??o a Hogwarts a??n sacudido por la tragedia ocurrida en el Torneo de los Tres Magos. Debido a que el Ministro de la Magia niega el regreso de Lord Voldemort, Harry se convierte en el centro de atenci??n de la comunidad m??gica. Mientras lucha con sus problemas en el colegio, incluyendo a la nueva profesora Dolores Umbridge, intentar?? aprender m??s sobre la misteriosa Orden del F??nix.";
String pelicula6 =
    "Harry, que comienza su sexto a??o en la escuela de magia de Hogwarts, descubre un misterioso libro propiedad de 'El Pr??ncipe Mestizo' con el cual aprende nuevos trucos. Voldemort va tomando control tanto del mundo Muggle como del mundo de la magia, y Hogwarts ya no es el lugar seguro que sol??a ser. Harry sospecha que tal vez hasta el castillo sea peligroso. Dumbledore sabe que la batalla final se aproxima r??pidamente, y por eso se preocupa mucho m??s por preparar a Harry para ello.";
String pelicula7 =
    "Harry, Ron y Hermione se van a una peligrosa misi??n para localizar y destruir el secreto de la inmortalidad y destrucci??n de Voldemort - los Horrocruces. Solos, sin la gu??a de sus profesores o la protecci??n del Profesor Dumbledore, los tres amigos deben apoyarse el uno en el otro m??s que nunca. Pero hay Fuerzas Oscuras en medio que amenazan con separarlos. Harry Potter se est?? acercando cada vez m??s a la tarea para la que se ha preparado desde el primer d??a que pis?? Hogwarts: la ??ltima batalla con Voldemort.";
String pelicula8 =
    "En la Parte 2 del ??pico final, la batalla entre las fuerzas del bien y las del mal en el mundo m??gico termina en una guerra suprema. Las apuestas est??n al m??ximo y nadie est?? a salvo. Pero es Harry Potter quien debe ser llamado para hacer el ??ltimo sacrificio, mientras se acerca al enfrentamiento con Lord Voldemort. Todo termina aqu??.";

//SINOPSIS LIBROS
String libro1 =
    "Harry Potter se ha quedado hu??rfano y vive en casa de sus abominables t??os y el insoportable primo Dudley. Harry se siente muy triste y solo, hasta que un buen d??a recibe una carta que cambiar?? su vida para siempre. En ella le comunican que ha sido aceptado como alumno en el Colegio Hogwarts de Magia.";
String libro2 =
    "Tras derrotar una vez m??s a lord Voldemort, su siniestro enemigo en Harry Potter y la piedra filosofal, Harry espera impaciente en casa de sus insoportables t??os el inicio del segundo curso del Colegio Hogwarts de Magia. Sin embargo, la espera dura poco, pues un elfo aparece en su habitaci??n y le advierte que una amenaza mortal se cierne sobre la escuela. As?? pues, Harry no se lo piensa dos veces y, acompa??ado de Ron, su mejor amigo, se dirige a Hogwarts en un coche volador. Pero ??puede un aprendiz de mago defender la escuela de los malvados que pretenden destruirla? Sin saber que alguien hab??a abierto la C??mara de los Secretos, dejando escapar una serie de monstruos peligrosos, Harry y sus amigos Ron y Hermione tendr??n que enfrentarse con ara??as gigantes, serpientes encantadas, fantasmas enfurecidos y, sobre todo, con la mism??sima reencarnaci??n de su m??s temible adversario.";
String libro3 =
    "Igual que en las dos primeras partes de la serie, Harry aguarda con impaciencia el inicio del tercer curso en el Colegio Hogwarts de Magia. Tras haber cumplido los trece a??os, solo y lejos de sus amigos, Harry se pelea con su bigotuda t??a Marge, a la que convierte en globo, y debe huir en un autob??s m??gico. Mientras tanto, de la prisi??n de Azkaban se ha escapado un terrible villano, Sirius Black, un asesino en serie con poderes m??gicos que fue c??mplice de lord Voldemort y que parece dispuesto a borrar a Harry del mapa. Y por si fuera poco, Harry deber?? enfrentarse tambi??n a unos terribles monstruos, los dementores, seres abominables capaces de robarle la felicidad a los magos y de eliminar todo recuerdo hermoso de aquellos que osan mirarlos. Lo que ninguno de estos malvados personajes sabe es que Harry, con la ayuda de sus fieles amigos Ron y Hermione, es capaz de todo y mucho m??s.";
String libro4 =
    "Tras otro abominable verano con los Dursley, Harry se dispone a iniciar el cuarto curso en Hogwarts, la famosa escuela de magia y hechicer??a. A sus catorce a??os, a Harry le gustar??a ser un joven mago como los dem??s y dedicarse a aprender nuevos sortilegios, encontrarse con sus amigos Ron y Hermione y asistir con ellos a los Mundiales de quidditch. Sin embargo, al llegar al colegio le espera una gran sorpresa que lo obligar?? a enfrentarse a los desaf??os m??s temibles de toda su vida. SI logra superarlos, habr?? demostrado que ya no es un ni??o y que est?? preparado para vivir las nuevas y emocionantes experiencias que el futuro le depara.";
String libro5 =
    "Las tediosas vacaciones de verano en casa de sus t??os todav??a no han acabado y Harry se encuentra m??s inquieto que nunca. Apenas ha tenido noticias de Ron y Hermione, y presiente que algo extra??o est?? sucediendo en Hogwarts. En efecto, cuando por fin comienza otro curso en el famoso colegio de magia y hechicer??a, sus temores de vuelven realidad. El Ministerio de Magia niega qu Voldemort haya regresado y ha iniciado una campa??a de desprestigio contra Harry y Dumbledore, para lo cual ha asignado a la horrible profesora Dolores Umbridge la tarea de vigilar todos sus movimientos. As?? pues, adem??s de sentirse solo e incomprendido, Harry sospecha que Voldemort puede adivinar sus pensamientos, e intuye que el temible mago trata de apoderarse de un objeto secreto que le permitir??a recuperar su poder destructivo.";
String libro6 =
    "Con diecis??is a??os cumplidos, Harry inicia el sexto curso en Hogwarts en medio de terribles acontecimientos que asolan Inglaterra. Elegido capit??n del equipo de quidditch, los ensayos, los ex??menes y las chicas ocupan todo su tiempo, pero la tranquilidad dura poco. A pesar de los f??rreos controles de seguridad que protegen la escuela, dos alumnos con brutalmente atacados. Dumbledore sabe que se acerca el momento, anunciado por la Profec??a, en que Harry y Voldemort se enfrentar??an a muerte: ??El ??nico con poder para vencer al Se??or Tenebroso se acerca... Uno de los dos debe morir a manos del otro, pues ninguno de los dos podr?? vivir mientras siga el otro con vida?? El anciano director solicitar?? la ayuda de Harry y juntos emprender??n peligrosos viajes para intentar debilitar al enemigo, para lo cual el joven mago contar?? con un viejo libro de pociones perteneciente a un misterioso personaje, alguien que se hace llamar Pr??ncipe Mestizo.";
String libro7 =
    "La fecha de acerca. Cuando cumpla diecisiete a??os, Harry perder?? el encantamiento protector que lo mantiene a salvo. El anunciado duelo a muerte con lord Voldemort es inminente, y la casi imposible misi??n de encontrar y destruir los restantes Horrocruxes, m??s urgente que nunca. Ha llegado la hora final, el momento de tomar decisiones dif??ciles. Harry debe abandonar la calidez de La Madriguera para seguir sin miedo ni vacilaciones el inexorable sendero trazado para ??l. Consciente de lo mucho que est?? en juego, tendr?? que buscar en su interior la fuerza necesaria que lo impulse en la vertiginosa carrera para enfrentarse a su destino.";
