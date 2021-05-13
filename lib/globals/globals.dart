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
    "Características: coraje y valentía. Un buen miembro de Gryffindor tiene gran osadía, temple y caballerosidad. Son capaces de todo por defender en lo que creen y nunca se dan por vencidos. También son capaces de romper las reglas si es necesario y les encantan los retos, cuanto más difíciles, mejor.";
String infoSly =
    "Cualidades. Los Slytherin tienden a ser líderes ambiciosos, astutos y fuertes, orientados a los logros. ... Según Albus Dumbledore, las cualidades que Salazar valoraba en los estudiantes que había elegido incluían inteligencia, ingenio, determinación y 'un cierto desdén por las reglas'.";
String infoRav =
    "Ravenclaw es una de las cuatro casas en las que se dividen los estudiantes del Colegio Hogwarts de Magia y Hechicería en el universo de los libros y películas de Harry Potter. Esta casa fue fundada por Rowena Ravenclaw y solo son escogidas personas inteligentes, creativas y sabias.";
String infoHuf =
    "Hufflepuff es la más inclusiva de las cuatro casas; el trabajo duro, la paciencia, la amistad y la honestidad son sumamente necesarias para ser miembros. Su animal emblemático es el tejón y sus colores son el amarillo y negro. Hufflepuff responde en gran medida a los elementos de la tierra.";

//INFO PERSONAJES DE CADA CASA
String infoPersonajeGry1 =
    "Harry James Potter, es el personaje principal de la serie de libros creada por la autora JK Rowling. Su historia se desarrolla en la Escuela Hogwarts de Magia y Hechicería, junto a sus mejores amigos, Ron Weasley y Hermione Granger. Su característica física más intrigante, es una cicatriz con forma de relámpago en su frente, la cual obtuvo cuando el Mago Oscuro Lord Voldemort intentó asesinarlo cuando sólo era un bebé de 1 año de edad, mediante la maldición asesina, Avada Kedavra. Voldemort asesinó a los padres de Harry y destruyó su hogar la noche del 31 de Octubre de 1981. Harry es famoso dentro del mundo mágico, por ser la única persona que ha sobrevivido al Avada Kedavra, causando la caída de Lord Voldemort.";
String infoPersonajeGry2 =
    "Hermione Jean Granger es una de las mejores amigas de Harry Potter y Ron Weasley. Debido a su fecha de nacimiento, Hermione es la mayor de sus compañeros, pues la mayoría de ellos nacieron a finales de 1979/1980. Ya que Hogwarts sólo acepta estudiantes de primer año que hayan cumplido 11 años antes del comienzo del año escolar el 01 de Septiembre, Hermione sería muy joven para unirse a la promoción anterior. Ella demuestra una considerable destreza académica, en comparación con sus amigos y compañeros, pero carece de madurez emocional. Constantemente responde negativamente a las provocaciones de Ron, pues generalmente no soporta quedar como ignorante o permitir que sus amigos hagan el ridículo.";
String infoPersonajeGry3 =
    "Ronald Bilius «Ron» Weasley apareció por primera vez en Harry Potter y la Piedra Filosofal, y es el mejor amigo de Harry Potter. Ron es un personaje que contrasta con Harry, pues usualmente recibe poca participación, mientras que Harry casi siempre es el centro de atención. En ocasiones, esto crea desavenencias entre los dos amigos. Ya que en Hogwarts él está en la misma casa que Harry, Gryffindor, Ron está presente en la mayoría de situaciones de la serie.";

String infoPersonajeSly1 =
    "Draco Malfoy es un alumno de Slytherin del Colegio Hogwarts de Magia y Hechicería. Nació el 5 de junio de 1980. Se caracteriza por ser arrogante y hablar arrastrando las palabras. Insulta continuamente a los nacidos de muggles (sangres sucia) o a los que él considera que no están a su altura. Demuestra estar orgulloso de proceder de una familia de sangre pura. Es hijo de Lucius Malfoy, mortífago a las órdenes de Lord Voldemort. Tiene el pelo rubio platino y los ojos grises. Suele ir acompañado por Crabbe y Goyle, de su mismo curso. En su primer año en Hogwarts, Draco le ofrece a Harry Potter ser su amigo, pero éste lo rechaza, y desde entoncesforjan un desprecio mutuo.";
String infoPersonajeSly2 =
    "Severus Snape Prince, es el profesor de Pociones (y de Defensa Contra las Artes Oscuras en Harry Potter y el Misterio del Príncipe) el Colegio Hogwarts de Magia y Hechicería. También es jefe de la casa Slytherin. Tiene un sentido del humor bastante sarcástico, y siempre quiere ridiculizar a los alumnos de otras casas, en especial a Harry Potter, a quien odia, debido a que le recuerda a James Potter, padre de éste, de quien fue su enemigo durante su etapa de estudiante. Su aspecto es el de un mago alto, muy delgado, de piel cetrina, dientes torcidos y nariz aguileña. Su cabello es negro al igual que sus ojos, largo y grasiento. Viste siempre de negro. Muchas veces se le compara con un murciélago.";
String infoPersonajeSly3 =
    "Lord Voldemort es el archi-villano del protagonista de la saga, Harry Potter. A lo largo de la serie, se le describe constantemente como un Mago Tenebroso obsesionado con el poder y la inmortalidad. También siente un odio genocida hacia los humanos carentes de magia. En todos los libros, su nombre es tan temido que muchos magos se niegan a pronunciarlo. La mayoría de los personajes lo llaman solo como «Ya-Sabes-Quien”, o “El-Que-No-Debe-Ser-Nombrado”. Con excepción de Harry Potter y el Prisionero de Azkaban, Voldemort ha aparecido en todos los libros de Harry Potter, ya sea en persona o en alguna manifestación mágica.";

String infoPersonajeRav1 =
    "Luna Lovegood es una alumna de Ravenclaw del colegio Hogwarts de Magia y Hechicería. Se la caracteriza por tener una personalidad indiferente. Siempre está en su mundo y le da igual lo que la gente piense de ella. Tiene ideas disparatadas que nadie comparte, pero que ella asegura que son firmes (como por ejemplo, asegura que los snorkacks de cuernos arrugados existen). Es hija de Xenophilius Lovegood, editor de El Quisquilloso, que comparte las mismas extravagantes ideas que su hija. Su madre murió en consecuencia de un experimente fallido.";
String infoPersonajeRav2 =
    "La Profesora Sybill Patricia Trelawney (nacida antes de 1963) era una bruja y profesora de Adivinación, junto a Firenze, en el Colegio Hogwarts de Magia y Hechicería. La tataranieta de la célebre vidente Cassandra Trelawney. Fue Trelawney quien hizo la profecía acerca de Voldemort y el que tiene el poder para vencerlo (Voldemort eligió como mayor amenaza a Harry Potter), durante su entrevista de trabajo con Albus Dumbledore. Al final del año escolar 1993-1994, predijo con exactitud el escape de Peter Pettigrew y el regreso de Lord Voldemort.";
String infoPersonajeRav3 =
    "Cho Chang fue una bruja que asistió al Colegio Hogwarts de Magia y Hechicería desde 1990 a 1997 y fue elegida para la Casa de Ravenclaw. Fue Buscadora del equipo de Quidditch de su casa y una estudiante popular. En quinto año de Cho, ella comenzó a salir con Cedric Diggory mientras era Campeón en el Torneo de los Tres Magos. Cedric se convirtió en una de las primeras bajas de la Segunda Guerra Mágica. Fue asesinado por Peter Pettigrew por orden de Lord Voldemort en junio de 1995. Su muerte hirió enormemente a Cho y la hizo decidida a luchar contra el recientemente devuelto Señor Tenebroso.";

String infoPersonajeHuf1 =
    "Nymphadora Tonks más comúnmente conocida como Tonks, ocasionalmente Dora, era una bruja mestiza y la única hija de Ted y Andrómeda Tonks (de soltera Black). Ella era metamorfomaga y asistió al Colegio Hogwarts de Magia y Hechicería desde 1984 hasta 1991. Fue clasificada en Hufflepuff y estuvo en el mismo año en Hogwarts que el Gryffindor Charlie Weasley. Después de dejar Hogwarts, Tonks se unió al Ministerio de Magia y se entrenó para convertirse en una Auror bajo la atenta mirada de Alastor Moody, calificando en 1994.";
String infoPersonajeHuf2 =
    "Newton Artemis Fido Scamander, (Orden de Merlín Segunda Clase), (n. 24 de febrero de 1897) era un famoso Magizoologista y autor de Animales fantásticos y dónde encontrarlos. Aún desde pequeño Scamander desarrolló un interés en las criaturas mágicas, influenciado por la cría de hipogrifos de su madre. Él asistió al Colegio Hogwarts de Magia y Hechicería, donde fue seleccionado para la casa Hufflepuff y más tarde expulsado. Scamander se unió al Ministerio de Magia, donde pasó dos años en la Oficina de Realojamiento de Elfos Domésticos antes de unirse a la División de Bestias. En 1918, él fue contratado por Augustus Worme de Libros Oscuros para escribir Animales fantásticos y dónde encontrarlos.";
String infoPersonajeHuf3 =
    "Cedric Diggory (septiembre/octubre de 1977 – 24 de junio de 1995) fue el hijo de Amos Diggory y su esposa. Comenzó a asistir al Colegio Hogwarts de Magia y Hechicería en 1989, y fue seleccionado para la casa Hufflepuff. Durante su estancia en el colegio fue prefecto y capitán del equipo de Quidditch de Hufflepuff, jugando como buscador. En su sexto año Cedric puso su nombre para competir en el Torneo de los Tres Magos. Fue seleccionado como campeón de Hogwarts y, aunque fue opacado en la prensa por Harry Potter, Cedric disfrutó casi del mismo apoyo del cuerpo estudiantil y luego de las primeras dos pruebas quedó empatado con Harry en el primer lugar. Cedric y Harry completaron el la tercera prueba juntos.";

//SINOPSIS PELICULAS
String pelicula1 =
    "El día de su cumpleaños, Harry Potter descubre que es hijo de dos conocidos hechiceros, de los que ha heredado poderes mágicos. Debe asistir a una famosa escuela de magia y hechicería, donde entabla una amistad con dos jóvenes que se convertirán en sus compañeros de aventura. Durante su primer año en Hogwarts, descubre que un malévolo y poderoso mago llamado Voldemort está en busca de una piedra filosofal que alarga la vida de quien la posee.";
String pelicula2 =
    "El joven mago Harry Potter, Ron Weasley y Hermione Granger se enfrentan a nuevos retos. Durante su segundo año en el Colegio Hogwarts de Magia y Hechicería, estos jovencitos intentan descubrir una fuerza oscura que esta aterrorizando al Colegio. Después de un largo verano, Harry Potter vuelve a la escuela donde de pronto empezará a preocuparse por la supervivencia, cuando cosas terribles comienzan a pasarle a él y a sus compañeros. Misteriosamente, palabras escritas sobre la pared brillan advirtiendo que 'la cámara secreta ha sido abierta'.";
String pelicula3 =
    "En su tercer año en Hogwarts, Harry, Ron y Hermione conocen a Sirius Black, el prisionero que ha escapado de Azkaban y aprenden a acercarse a un Hippogriffo mitad caballo/ mitad águila, a como transformar a los cambiantes Boggarts y el arte de la Adivinación. Harry deberá enfrentárse a los Dementores que son ladrones de almas, defenderse del peligroso hombre lobo y lidiar con la verdad acerca de la relación entre Sirius Black y sus padres.";
String pelicula4 =
    "Cuando el nombre de Harry Potter emerge del Cáliz de Fuego, se convierte en un competidor en una batalla agotadora por la gloria entre tres colegios de magos – El Torneo de los Tres Magos. Pero ya que Harry nunca presentó su nombre para El Torneo, ¿quién lo hizo? Ahora Harry debe enfrentar a un dragón infalible, demonios acuáticos feroces y un laberinto encantado, solamente para encontrarse con el cruel descubrimiento de El Quien No Debe Ser Nombrado.";
String pelicula5 =
    "Harry Potter regresa por quinto año a Hogwarts aún sacudido por la tragedia ocurrida en el Torneo de los Tres Magos. Debido a que el Ministro de la Magia niega el regreso de Lord Voldemort, Harry se convierte en el centro de atención de la comunidad mágica. Mientras lucha con sus problemas en el colegio, incluyendo a la nueva profesora Dolores Umbridge, intentará aprender más sobre la misteriosa Orden del Fénix.";
String pelicula6 =
    "Harry, que comienza su sexto año en la escuela de magia de Hogwarts, descubre un misterioso libro propiedad de 'El Príncipe Mestizo' con el cual aprende nuevos trucos. Voldemort va tomando control tanto del mundo Muggle como del mundo de la magia, y Hogwarts ya no es el lugar seguro que solía ser. Harry sospecha que tal vez hasta el castillo sea peligroso. Dumbledore sabe que la batalla final se aproxima rápidamente, y por eso se preocupa mucho más por preparar a Harry para ello.";
String pelicula7 =
    "Harry, Ron y Hermione se van a una peligrosa misión para localizar y destruir el secreto de la inmortalidad y destrucción de Voldemort - los Horrocruces. Solos, sin la guía de sus profesores o la protección del Profesor Dumbledore, los tres amigos deben apoyarse el uno en el otro más que nunca. Pero hay Fuerzas Oscuras en medio que amenazan con separarlos. Harry Potter se está acercando cada vez más a la tarea para la que se ha preparado desde el primer día que pisó Hogwarts: la última batalla con Voldemort.";
String pelicula8 =
    "En la Parte 2 del épico final, la batalla entre las fuerzas del bien y las del mal en el mundo mágico termina en una guerra suprema. Las apuestas están al máximo y nadie está a salvo. Pero es Harry Potter quien debe ser llamado para hacer el último sacrificio, mientras se acerca al enfrentamiento con Lord Voldemort. Todo termina aquí.";

//SINOPSIS LIBROS
String libro1 =
    "Harry Potter se ha quedado huérfano y vive en casa de sus abominables tíos y el insoportable primo Dudley. Harry se siente muy triste y solo, hasta que un buen día recibe una carta que cambiará su vida para siempre. En ella le comunican que ha sido aceptado como alumno en el Colegio Hogwarts de Magia.";
String libro2 =
    "Tras derrotar una vez más a lord Voldemort, su siniestro enemigo en Harry Potter y la piedra filosofal, Harry espera impaciente en casa de sus insoportables tíos el inicio del segundo curso del Colegio Hogwarts de Magia. Sin embargo, la espera dura poco, pues un elfo aparece en su habitación y le advierte que una amenaza mortal se cierne sobre la escuela. Así pues, Harry no se lo piensa dos veces y, acompañado de Ron, su mejor amigo, se dirige a Hogwarts en un coche volador. Pero ¿puede un aprendiz de mago defender la escuela de los malvados que pretenden destruirla? Sin saber que alguien había abierto la Cámara de los Secretos, dejando escapar una serie de monstruos peligrosos, Harry y sus amigos Ron y Hermione tendrán que enfrentarse con arañas gigantes, serpientes encantadas, fantasmas enfurecidos y, sobre todo, con la mismísima reencarnación de su más temible adversario.";
String libro3 =
    "Igual que en las dos primeras partes de la serie, Harry aguarda con impaciencia el inicio del tercer curso en el Colegio Hogwarts de Magia. Tras haber cumplido los trece años, solo y lejos de sus amigos, Harry se pelea con su bigotuda tía Marge, a la que convierte en globo, y debe huir en un autobús mágico. Mientras tanto, de la prisión de Azkaban se ha escapado un terrible villano, Sirius Black, un asesino en serie con poderes mágicos que fue cómplice de lord Voldemort y que parece dispuesto a borrar a Harry del mapa. Y por si fuera poco, Harry deberá enfrentarse también a unos terribles monstruos, los dementores, seres abominables capaces de robarle la felicidad a los magos y de eliminar todo recuerdo hermoso de aquellos que osan mirarlos. Lo que ninguno de estos malvados personajes sabe es que Harry, con la ayuda de sus fieles amigos Ron y Hermione, es capaz de todo y mucho más.";
String libro4 =
    "Tras otro abominable verano con los Dursley, Harry se dispone a iniciar el cuarto curso en Hogwarts, la famosa escuela de magia y hechicería. A sus catorce años, a Harry le gustaría ser un joven mago como los demás y dedicarse a aprender nuevos sortilegios, encontrarse con sus amigos Ron y Hermione y asistir con ellos a los Mundiales de quidditch. Sin embargo, al llegar al colegio le espera una gran sorpresa que lo obligará a enfrentarse a los desafíos más temibles de toda su vida. SI logra superarlos, habrá demostrado que ya no es un niño y que está preparado para vivir las nuevas y emocionantes experiencias que el futuro le depara.";
String libro5 =
    "Las tediosas vacaciones de verano en casa de sus tíos todavía no han acabado y Harry se encuentra más inquieto que nunca. Apenas ha tenido noticias de Ron y Hermione, y presiente que algo extraño está sucediendo en Hogwarts. En efecto, cuando por fin comienza otro curso en el famoso colegio de magia y hechicería, sus temores de vuelven realidad. El Ministerio de Magia niega qu Voldemort haya regresado y ha iniciado una campaña de desprestigio contra Harry y Dumbledore, para lo cual ha asignado a la horrible profesora Dolores Umbridge la tarea de vigilar todos sus movimientos. Así pues, además de sentirse solo e incomprendido, Harry sospecha que Voldemort puede adivinar sus pensamientos, e intuye que el temible mago trata de apoderarse de un objeto secreto que le permitiría recuperar su poder destructivo.";
String libro6 =
    "Con dieciséis años cumplidos, Harry inicia el sexto curso en Hogwarts en medio de terribles acontecimientos que asolan Inglaterra. Elegido capitán del equipo de quidditch, los ensayos, los exámenes y las chicas ocupan todo su tiempo, pero la tranquilidad dura poco. A pesar de los férreos controles de seguridad que protegen la escuela, dos alumnos con brutalmente atacados. Dumbledore sabe que se acerca el momento, anunciado por la Profecía, en que Harry y Voldemort se enfrentarían a muerte: «El único con poder para vencer al Señor Tenebroso se acerca... Uno de los dos debe morir a manos del otro, pues ninguno de los dos podrá vivir mientras siga el otro con vida» El anciano director solicitará la ayuda de Harry y juntos emprenderán peligrosos viajes para intentar debilitar al enemigo, para lo cual el joven mago contará con un viejo libro de pociones perteneciente a un misterioso personaje, alguien que se hace llamar Príncipe Mestizo.";
String libro7 =
    "La fecha de acerca. Cuando cumpla diecisiete años, Harry perderá el encantamiento protector que lo mantiene a salvo. El anunciado duelo a muerte con lord Voldemort es inminente, y la casi imposible misión de encontrar y destruir los restantes Horrocruxes, más urgente que nunca. Ha llegado la hora final, el momento de tomar decisiones difíciles. Harry debe abandonar la calidez de La Madriguera para seguir sin miedo ni vacilaciones el inexorable sendero trazado para él. Consciente de lo mucho que está en juego, tendrá que buscar en su interior la fuerza necesaria que lo impulse en la vertiginosa carrera para enfrentarse a su destino.";
