import 'package:get/get.dart';

import '../models/exercise_model.dart';
import '../models/workout_model.dart';

class WorkoutController extends GetxController {
  static WorkoutController get instance => Get.find();

  int selectedDifficultyIdx = 0;

  final List<String> difficulties = [
    "All",
    "Beginner",
    "Intermediate",
    "Advanced"
  ];

  void selectDifficulty(int value){
    selectedDifficultyIdx = value;
    update();
  }

  final List<Workout> workouts = [
    Workout(
      name: 'Legs Workout',
      duration: 60,
      numExercises: 8,
      caloriesBurned: 400.0,
      img: 'https://th.bing.com/th/id/R.c181a784171cdc0eb94fb60373c72b7c?rik=7P6KQwofqZmdJw&riu=http%3a%2f%2fwww.muscleseek.com%2fwp-content%2fuploads%2f2013%2f02%2fcalf-muscles.jpg&ehk=8usCAREvxhUK41FofEwryTBhFc3eOOiDhcDc3tD%2bTww%3d&risl=&pid=ImgRaw&r=0',
      cover: "https://www.pinclipart.com/picdir/big/537-5379228_squat-vector-transparent-runner-knee-stretches-clipart.png",
      exercises: [
        Exercise(
          name: 'Barbell Back Squats',
          sets: 4,
          difficulty: ExerciseDifficulty.intermediate,
          videoId: "EzvnMZuxGWw",
          img: "https://th.bing.com/th/id/R.fbd02c6629ffa5b04c7adf9d62ed9e2e?rik=oRrxNwztkKnNPA&pid=ImgRaw&r=0",
          description:
              'Target your quadriceps, hamstrings, and glutes with barbell back squats. This compound exercise is fundamental for building overall lower body strength. Use a squat rack for safety and focus on maintaining a neutral spine throughout the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Barbell', image: 'https://cdn4.iconfinder.com/data/icons/sports-recreation/128/barbell-1024.png'),
            ExerciseMaterial(
                title: 'Squat Rack', image: 'https://cdn2.iconfinder.com/data/icons/gym-80/64/squat_rack_weightlifting_gym_fitness-1024.png'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description:
                  'Place the barbell on your upper back, resting it across your trapezius muscles. Position your feet shoulder-width apart.',
            ),
            ExerciseStep(
              title: 'Descent',
              description:
                  'Lower your body by bending your knees and hips, keeping your back straight. Descend until your thighs are parallel to the ground.',
            ),
            ExerciseStep(
              title: 'Ascent',
              description:
                  'Push through your heels to return to the starting position, fully extending your hips and knees.',
            ),
          ],
        ),
        Exercise(
          name: 'Bulgarian Split Squats',
          sets: 3,
          difficulty: ExerciseDifficulty.advanced,
          videoId: "uODWo4YqbT8",
          img: "https://static.strengthlevel.com/images/illustrations/dumbbell-bulgarian-split-squat-1000x1000.jpg",
          description:
              'Isolate each leg with Bulgarian split squats. This unilateral exercise targets the quads, hamstrings, and glutes while improving balance and stability. Use a bench or step to elevate one foot and maintain proper form throughout the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Dumbbells', image: 'https://e7.pngegg.com/pngimages/515/333/png-clipart-h-m-font-design-hand-weights.png'),
            ExerciseMaterial(title: 'Bench', image: 'https://cdn1.iconfinder.com/data/icons/sports-254/53/37-512.png'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description:
                  'Stand with one foot elevated behind you on a bench or step. Hold a dumbbell in each hand at your sides.',
            ),
            ExerciseStep(
              title: 'Descent',
              description:
                  'Lower your body by bending your front knee, keeping your back knee close to the ground. Ensure your front knee is directly above your ankle.',
            ),
            ExerciseStep(
              title: 'Ascent',
              description:
                  'Push through your front heel to return to the starting position. Repeat on the other leg.',
            ),
          ],
        ),
        Exercise(
          name: 'Romanian Dead Lift',
          sets: 4,
          difficulty: ExerciseDifficulty.intermediate,
          videoId: "5rIqP63yWFg",
          img: "https://www.inspireusafoundation.org/wp-content/uploads/2022/06/barbell-romanian-deadlift-benefits.jpg",
          description:
              'Focus on the posterior chain with Romanian deadlifts. This exercise targets the hamstrings and glutes while placing less stress on the lower back. Use a barbell or dumbbells and emphasize the hip hinge movement.',
          materialNeeded: [
            ExerciseMaterial(
                title: 'Barbell',
                image: 'https://cdn4.iconfinder.com/data/icons/sports-recreation/128/barbell-1024.png'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description:
                  'Hold a barbell in front of you with a shoulder-width grip or a dumbbell in each hand. Stand with feet hip-width apart.',
            ),
            ExerciseStep(
              title: 'Descent',
              description:
                  'Hinge at the hips, pushing your hips back while maintaining a slight bend in your knees. Lower the barbell or dumbbells towards the ground.',
            ),
            ExerciseStep(
              title: 'Ascent',
              description:
                  'Engage your hamstrings and glutes to return to the starting position, standing upright with a neutral spine.',
            ),
          ],
        ),
        Exercise(
          name: 'Box Jumps',
          sets: 3,
          difficulty: ExerciseDifficulty.advanced,
          videoId: "NBY9-kTuHEk",
          img: "https://th.bing.com/th/id/R.418bd99fca5e1c17f2527cab6d53667a?rik=Fpb%2bGVF3Z%2fGJhQ&riu=http%3a%2f%2fs3.amazonaws.com%2fprod.skimble%2fassets%2f1526018%2fskimble-workout-trainer-exercise-box-jumps_square_iphone.jpg&ehk=1qjLAs10nPEoFV%2bQif5QZYsIl68qqeufh%2f9I9cHlnJw%3d&risl=&pid=ImgRaw&r=0",
          description:
              'Enhance explosive power and agility with box jumps. This plyometric exercise challenges the lower body and boosts cardiovascular fitness. Box jumps are suitable for advanced individuals with a strong foundation in lower body exercises. Start with a lower box height and progress gradually.',
          materialNeeded: [
            ExerciseMaterial(
                title: 'Sturdy Box or Platform', image: 'box_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description:
                  'Stand in front of a sturdy box, ensuring it is stable and appropriate for your fitness level.',
            ),
            ExerciseStep(
              title: 'Jump',
              description:
                  'Jump onto the box, landing softly with your knees slightly bent to absorb the impact.',
            ),
            ExerciseStep(
              title: 'Return',
              description:
                  'Step back down and repeat the movement, focusing on explosiveness and controlled landings.',
            ),
          ],
        ),
        Exercise(
          name: 'Leg Press',
          sets: 4,
          difficulty: ExerciseDifficulty.beginner,
          videoId: "ahaJTts1f3s",
          img: "https://th.bing.com/th/id/R.05880ddd34d0fc28361a2af764d86975?rik=yetZsqDeiywDbg&riu=http%3a%2f%2fbest-exercise.com%2fwp-content%2fuploads%2f2018%2f08%2fleg-press.jpg&ehk=yiBmyLonXksi5UXUN88qx8l%2bjcve9QvAFVLNFEzrc%2fY%3d&risl=&pid=ImgRaw&r=0",
          description:
              'Target the quads, hamstrings, and glutes with the leg press machine. This exercise provides a controlled and supported way to build lower body strength. Adjust the machine to your comfort level and gradually increase the weight as your strength improves.',
          materialNeeded: [
            ExerciseMaterial(
                title: 'Leg Press Machine',
                image: 'leg_press_machine_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description:
                  'Sit on the leg press machine with your back against the pad, feet shoulder-width apart on the platform.',
            ),
            ExerciseStep(
              title: 'Ascent',
              description:
                  'Push the platform away by extending your knees, ensuring your knees do not lock out at the top.',
            ),
            ExerciseStep(
              title: 'Descent',
              description:
                  'Lower the platform back down to the starting position with controlled movements.',
            ),
          ],
        ),
        Exercise(
          name: 'Walking Lunges',
          sets: 3,
          difficulty: ExerciseDifficulty.intermediate,
          videoId: "LRoSqkvpj10",
          img: "https://th.bing.com/th/id/R.1d163d529aa7270cbe347f483d1335ae?rik=tc2qJ1SwAEijLQ&pid=ImgRaw&r=0",
          description:
              'Improve leg strength and coordination with walking lunges. This exercise targets the quadriceps, hamstrings, and glutes while also engaging the core for stability. Perform walking lunges with a controlled range of motion and maintain proper form throughout the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Dumbbells', image: 'dumbbell_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description:
                  'Hold a dumbbell in each hand at your sides, with feet together.',
            ),
            ExerciseStep(
              title: 'Step Forward',
              description:
                  'Take a step forward with one leg, lowering your body until both knees are bent at a 90-degree angle.',
            ),
            ExerciseStep(
              title: 'Push Back',
              description:
                  'Push off the front foot to return to the starting position. Repeat on the other leg.',
            ),
          ],
        ),
        Exercise(
          name: 'Hamstring Curls',
          sets: 3,
          difficulty: ExerciseDifficulty.beginner,
          videoId: "5Cyui1aLR9g",
          img: 'https://www.bodybuilding.com/images/2016/september/leg-curls-done-light-facebook-v2-960x540.jpg',
          description:
              'Isolate the hamstrings with leg curls. This exercise helps develop the muscles at the back of the thigh, contributing to overall leg symmetry. Perform hamstring curls with controlled movements, emphasizing the contraction of the hamstring muscles.',
          materialNeeded: [
            ExerciseMaterial(
                title: 'Leg Curl Machine', image: 'leg_curl_machine_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description:
                  'Lie facedown on a leg curl machine, adjusting the pad to rest just above your heels.',
            ),
            ExerciseStep(
              title: 'Curl',
              description:
                  'Flex your knees to lift the pad toward your glutes, squeezing your hamstrings at the top of the movement.',
            ),
            ExerciseStep(
              title: 'Extension',
              description:
                  'Extend your legs back to the starting position with controlled movements.',
            ),
          ],
        ),
        Exercise(
          name: 'Step-Ups',
          sets: 3,
          difficulty: ExerciseDifficulty.beginner,
          img: 'https://www.radianthealthmag.com/wp-content/uploads/2014/09/19-Sept-Step-Ups-featured.jpg',
          videoId: "PzDbmqL6qo8",
          description:
              'Improve lower body strength and coordination with step-ups. This exercise targets the quads, hamstrings, and glutes while also engaging the core for stability. Use a sturdy step or bench and focus on controlled movements.',
          materialNeeded: [
            ExerciseMaterial(
                title: 'Step or Bench', image: 'step_bench_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description:
                  'Stand in front of a step or bench, placing one foot on the elevated surface.',
            ),
            ExerciseStep(
              title: 'Ascent',
              description:
                  'Step up onto the surface, fully extending the hip and knee of the leading leg.',
            ),
            ExerciseStep(
              title: 'Descent',
              description:
                  'Step back down to the starting position with controlled movements, repeating on the other leg.',
            ),
          ],
        ),
        // Add more detailed exercises as needed
      ],
    ),
    Workout(
        name: 'Chest Workout',
        duration: 45,
        numExercises: 10,
        caloriesBurned: 350.0,
        img: 'https://img.freepik.com/free-photo/young-man-with-perfect-body-holding-red-apple-his-hand_186202-8853.jpg?w=996&t=st=1706533424~exp=1706534024~hmac=6328c534ba28067ae805a7c25de74977a5f958624e31e64d65aea7ea24f55c92',
        cover: 'https://cdn3.iconfinder.com/data/icons/diet-fitness-4/512/chest-tool-fitness-muscle-512.png',
        exercises: [
          Exercise(
            name: 'Bench Press',
            sets: 4,
            difficulty: ExerciseDifficulty.beginner,
            description:
                'Build overall chest strength with the bench press. This compound exercise targets the pectoral muscles, shoulders, and triceps. Use a flat bench and a barbell for optimal results. Focus on a controlled descent and explosive ascent.',
            materialNeeded: [
              ExerciseMaterial(title: 'Barbell', image: 'barbell_image.jpg'),
              ExerciseMaterial(title: 'Bench', image: 'bench_image.jpg'),
            ],
            howItsDone: [
              ExerciseStep(
                title: 'Setup',
                description:
                    'Lie on a flat bench with your feet planted on the ground. Grip the barbell with hands slightly wider than shoulder-width apart.',
              ),
              ExerciseStep(
                title: 'Descent',
                description:
                    'Lower the barbell to your chest with controlled movements, keeping your elbows at a 90-degree angle.',
              ),
              ExerciseStep(
                title: 'Ascent',
                description:
                    'Push the barbell back to the starting position, fully extending your arms. Maintain stability and control throughout the movement.',
              ),
            ],
          ),
          Exercise(
            name: 'Dumbbell Flyes',
            sets: 3,
            difficulty: ExerciseDifficulty.beginner,
            description:
                'Isolate the chest muscles with dumbbell flyes. This exercise emphasizes the stretching and contracting of the pectoral muscles. Use a flat bench and a pair of dumbbells. Focus on a wide range of motion and controlled movements.',
            materialNeeded: [
              ExerciseMaterial(title: 'Dumbbells', image: 'dumbbell_image.jpg'),
              ExerciseMaterial(title: 'Flat Bench', image: 'bench_image.jpg'),
            ],
            howItsDone: [
              ExerciseStep(
                title: 'Setup',
                description:
                    'Lie on a flat bench with a dumbbell in each hand, arms extended directly above your chest.',
              ),
              ExerciseStep(
                title: 'Descent',
                description:
                    'Lower the dumbbells to the sides, maintaining a slight bend in your elbows. Feel the stretch in your chest muscles.',
              ),
              ExerciseStep(
                title: 'Ascent',
                description:
                    'Bring the dumbbells back to the starting position by contracting your chest muscles. Keep a controlled pace.',
              ),
            ],
          ),
          Exercise(
            name: 'Incline Bench Press',
            sets: 4,
            difficulty: ExerciseDifficulty.beginner,
            description:
                'Target the upper chest with the incline bench press. Adjust the bench to a 15-30 degree incline. This variation emphasizes the clavicular head of the pectoralis major. Use a barbell and focus on maintaining proper form throughout the exercise.',
            materialNeeded: [
              ExerciseMaterial(title: 'Barbell', image: 'barbell_image.jpg'),
              ExerciseMaterial(
                  title: 'Incline Bench', image: 'inclined_bench_image.jpg'),
            ],
            howItsDone: [
              ExerciseStep(
                title: 'Setup',
                description:
                    'Lie on an incline bench with your feet flat on the ground. Grip the barbell with hands slightly wider than shoulder-width apart.',
              ),
              ExerciseStep(
                title: 'Descent',
                description:
                    'Lower the barbell to your upper chest with controlled movements. Keep your elbows at a 90-degree angle.',
              ),
              ExerciseStep(
                title: 'Ascent',
                description:
                    'Push the barbell back to the starting position, fully extending your arms. Focus on the contraction of the upper chest muscles.',
              ),
            ],
          ),
          Exercise(
            name: 'Chest Dips',
            sets: 3,
            difficulty: ExerciseDifficulty.intermediate,
            description:
                'Engage the chest, shoulders, and triceps with chest dips. Use parallel bars or dip stations. Lean slightly forward to target the chest muscles. Focus on a full range of motion and controlled movements.',
            materialNeeded: [
              ExerciseMaterial(
                  title: 'Parallel Bars', image: 'parallel_bars_image.jpg'),
            ],
            howItsDone: [
              ExerciseStep(
                title: 'Setup',
                description:
                    'Grip parallel bars with your arms fully extended. Lift your legs off the ground and cross them for stability.',
              ),
              ExerciseStep(
                title: 'Descent',
                description:
                    'Lower your body by bending your elbows, leaning forward to emphasize the chest muscles. Descend until your upper arms are parallel to the ground.',
              ),
              ExerciseStep(
                title: 'Ascent',
                description:
                    'Push through your palms to return to the starting position. Focus on the contraction of the chest muscles.',
              ),
            ],
          ),
          Exercise(
            name: 'Chest Pullover',
            sets: 3,
            difficulty: ExerciseDifficulty.intermediate,
            description:
                'Isolate the chest and engage the serratus anterior with chest pullovers. Use a bench and a dumbbell. This exercise also targets the lats and intercostal muscles. Maintain a slight bend in your elbows and focus on the stretch and contraction.',
            materialNeeded: [
              ExerciseMaterial(title: 'Dumbbell', image: 'dumbbell_image.jpg'),
              ExerciseMaterial(title: 'Bench', image: 'bench_image.jpg'),
            ],
            howItsDone: [
              ExerciseStep(
                title: 'Setup',
                description:
                    'Lie on a bench with only your upper back and shoulders on the surface. Hold a dumbbell with both hands directly above your chest.',
              ),
              ExerciseStep(
                title: 'Descent',
                description:
                    'Lower the dumbbell backward, keeping a slight bend in your elbows. Feel the stretch in your chest and lats.',
              ),
              ExerciseStep(
                title: 'Ascent',
                description:
                    'Bring the dumbbell back to the starting position by engaging your chest and lats. Focus on the contraction at the top.',
              ),
            ],
          ),
          Exercise(
            name: 'Push-Ups',
            sets: 3,
            difficulty: ExerciseDifficulty.beginner,
            description:
                'Enhance chest strength with push-ups. This bodyweight exercise targets the chest, shoulders, and triceps. Maintain a straight line from head to heels and focus on a full range of motion.',
            materialNeeded: [
              ExerciseMaterial(title: 'None', image: ''),
            ],
            howItsDone: [
              ExerciseStep(
                title: 'Setup',
                description:
                    'Start in a plank position with your hands slightly wider than shoulder-width apart.',
              ),
              ExerciseStep(
                title: 'Descent',
                description:
                    'Lower your body by bending your elbows, keeping them close to your sides. Descend until your chest is close to the ground.',
              ),
              ExerciseStep(
                title: 'Ascent',
                description:
                    'Push through your palms to return to the starting position. Keep your body straight throughout the movement.',
              ),
            ],
          ),
          Exercise(
            name: 'Cable Crossover',
            sets: 3,
            difficulty: ExerciseDifficulty.intermediate,
            description:
                'Isolate the chest and achieve a full range of motion with cable crossovers. Use cable machines with adjustable arms. This exercise targets the inner chest muscles. Focus on the squeeze at the center of the movement.',
            materialNeeded: [
              ExerciseMaterial(
                  title: 'Cable Machine', image: 'cable_machine_image.jpg'),
            ],
            howItsDone: [
              ExerciseStep(
                title: 'Setup',
                description:
                    'Stand in the center of a cable machine, adjusting the arms to shoulder height. Hold one handle in each hand.',
              ),
              ExerciseStep(
                title: 'Crossover',
                description:
                    'Bring the handles together in front of your chest, focusing on squeezing the inner chest muscles. Maintain a slight bend in your elbows.',
              ),
              ExerciseStep(
                title: 'Return',
                description:
                    'Open your arms back to the starting position with controlled movements. Feel the stretch in your chest.',
              ),
            ],
          ),
          Exercise(
            name: 'Pec Deck Machine Flyes',
            sets: 3,
            difficulty: ExerciseDifficulty.intermediate,
            description:
                'Isolate the chest muscles with pec deck machine flyes. This exercise targets the pectoralis major while providing support for the back. Adjust the machine to your comfort level and focus on a controlled range of motion.',
            materialNeeded: [
              ExerciseMaterial(
                  title: 'Pec Deck Machine',
                  image: 'pec_deck_machine_image.jpg'),
            ],
            howItsDone: [
              ExerciseStep(
                title: 'Setup',
                description:
                    'Sit on the pec deck machine with your back against the pad. Adjust the arms to align with your chest.',
              ),
              ExerciseStep(
                title: 'Flyes',
                description:
                    'Bring the arms together in front of your chest, focusing on squeezing the pectoral muscles. Maintain a slight bend in your elbows.',
              ),
              ExerciseStep(
                title: 'Return',
                description:
                    'Open the arms back to the starting position with controlled movements. Feel the stretch in your chest.',
              ),
            ],
          ),
          Exercise(
            name: 'Medicine Ball Push-Ups',
            sets: 3,
            difficulty: ExerciseDifficulty.advanced,
            description:
                'Add instability to push-ups with medicine ball push-ups. This variation engages the chest, shoulders, and stabilizing muscles. Place your hands on medicine balls and focus on maintaining balance throughout the movement.',
            materialNeeded: [
              ExerciseMaterial(
                  title: 'Medicine Balls', image: 'medicine_ball_image.jpg'),
            ],
            howItsDone: [
              ExerciseStep(
                title: 'Setup',
                description:
                    'Start in a plank position with your hands on separate medicine balls, slightly wider than shoulder-width apart.',
              ),
              ExerciseStep(
                title: 'Push-Up',
                description:
                    'Lower your body by bending your elbows, keeping them close to your sides. Descend until your chest is close to the ground.',
              ),
              ExerciseStep(
                title: 'Return',
                description:
                    'Push through your palms to return to the starting position. Keep your body straight and maintain balance on the medicine balls.',
              ),
            ],
          ),
        ],),
    Workout(
      name: 'Back Workout',
      duration: 50,
      numExercises: 10,
      caloriesBurned: 400.0,
      cover: "https://cdn3.iconfinder.com/data/icons/back-building-exercises-and-muscle-building/330/back-building-exercises-011-512.png",
      img: "https://img.freepik.com/free-photo/back-view-young-athletic-sports-man-standing-with-hands-his-waist_171337-7542.jpg?w=1060&t=st=1706533528~exp=1706534128~hmac=ce1311de3174a61f89b16c399e4e974dd9f2f477d9dd2aa674241916e27f0792",
      exercises: [
        Exercise(
          name: 'Dead Lift',
          sets: 4,
          difficulty: ExerciseDifficulty.intermediate,
          description: 'Build overall back strength with dead lift. This compound exercise targets the erector spinae, lats, and traps. Use a barbell with proper form, keeping your back straight and engaging your core throughout the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Barbell', image: 'barbell_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Stand with your feet hip-width apart and grip the barbell with hands slightly wider than shoulder-width apart.',
            ),
            ExerciseStep(
              title: 'Lift',
              description: 'Engage your core and lift the barbell by straightening your hips and knees. Keep the barbell close to your body throughout the movement.',
            ),
            ExerciseStep(
              title: 'Lower',
              description: 'Lower the barbell back to the ground with controlled movements, maintaining a neutral spine. Bend at your hips and knees.',
            ),
          ],
        ),
        Exercise(
          name: 'Lat Pulldowns',
          sets: 3,
          difficulty: ExerciseDifficulty.beginner,
          description: 'Target the latissimus dorsi with lat pulldowns. Use a cable machine with an overhead bar. This exercise helps build a V-shaped back. Focus on a controlled range of motion and squeezing your lats at the bottom of the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Cable Machine', image: 'cable_machine_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Sit facing the cable machine with a straight back. Adjust the knee pads to secure your legs in place. Grip the overhead bar with hands slightly wider than shoulder-width apart.',
            ),
            ExerciseStep(
              title: 'Pull',
              description: 'Pull the bar down to your chest by engaging your lat muscles. Keep your elbows close to your sides and focus on the contraction at the bottom of the movement.',
            ),
            ExerciseStep(
              title: 'Release',
              description: 'Release the bar back to the starting position with controlled movements, fully extending your arms.',
            ),
          ],
        ),
        Exercise(
          name: 'Bent Over Rows',
          sets: 4,
          difficulty: ExerciseDifficulty.beginner,
          description: 'Strengthen the upper back and lats with bent-over rows. Use a barbell or dumbbells and maintain a flat back throughout the exercise. Focus on pulling the weight to your lower chest while keeping your elbows close to your sides.',
          materialNeeded: [
            ExerciseMaterial(title: 'Barbell or Dumbbells', image: 'barbell_dumbbells_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Stand with your feet hip-width apart, holding a barbell or dumbbells with an overhand grip. Bend at your hips until your torso is almost parallel to the ground.',
            ),
            ExerciseStep(
              title: 'Row',
              description: 'Pull the weight to your lower chest by squeezing your shoulder blades together. Keep your elbows close to your sides and maintain a flat back.',
            ),
            ExerciseStep(
              title: 'Lower',
              description: 'Lower the weight back to the starting position with controlled movements, maintaining a flat back.',
            ),
          ],
        ),
        Exercise(
          name: 'Pull-Ups',
          sets: 3,
          difficulty: ExerciseDifficulty.advanced,
          description: 'Challenge your upper back and lats with pull-ups. This bodyweight exercise targets multiple muscle groups. Grip a pull-up bar with hands slightly wider than shoulder-width apart. Focus on a full range of motion and controlled movements.',
          materialNeeded: [
            ExerciseMaterial(title: 'Pull-Up Bar', image: 'pull_up_bar_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Hang',
              description: 'Hang from the pull-up bar with an overhand grip, arms fully extended and slightly wider than shoulder-width apart.',
            ),
            ExerciseStep(
              title: 'Pull-Up',
              description: 'Pull your body up towards the bar by engaging your lats. Keep your core tight and focus on a controlled ascent.',
            ),
            ExerciseStep(
              title: 'Lower',
              description: 'Lower your body back to the hanging position with controlled movements. Maintain a straight line from head to heels.',
            ),
          ],
        ),
        Exercise(
          name: 'T-Bar Rows',
          sets: 3,
          difficulty: ExerciseDifficulty.intermediate,
          description: 'Isolate the middle back with T-bar rows. Use a T-bar row machine or landmine attachment. Maintain a flat back and focus on pulling the weight towards your lower chest. This exercise targets the rhomboids and lats.',
          materialNeeded: [
            ExerciseMaterial(title: 'T-Bar Row Machine or Landmine Attachment', image: 't_bar_row_machine_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Place the bar in the T-bar row machine or landmine attachment. Stand with your chest against the pad, gripping the handles with an overhand grip.',
            ),
            ExerciseStep(
              title: 'Row',
              description: 'Pull the weight towards your lower chest by retracting your shoulder blades. Keep your elbows close to your sides and maintain a flat back.',
            ),
            ExerciseStep(
              title: 'Lower',
              description: 'Lower the weight back to the starting position with controlled movements, maintaining a flat back.',
            ),
          ],
        ),
        Exercise(
          name: 'Face Pulls',
          sets: 3,
          difficulty: ExerciseDifficulty.intermediate,
          description: 'Target the rear delts and upper traps with face pulls. Use a cable machine with a rope attachment. Stand facing the machine and pull the rope towards your face. Focus on squeezing your shoulder blades together at the end of the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Cable Machine with Rope Attachment', image: 'cable_machine_rope_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Set the cable machine to chest height and attach a rope. Stand facing the machine, holding the ends of the rope with an overhand grip.',
            ),
            ExerciseStep(
              title: 'Pull',
              description: 'Pull the rope towards your face by squeezing your rear delts and upper traps. Focus on the contraction at the end of the movement.',
            ),
            ExerciseStep(
              title: 'Release',
              description: 'Release the rope back to the starting position with controlled movements, maintaining a neutral spine.',
            ),
          ],
        ),
        Exercise(
          name: 'Single-Arm Dumbbell Rows',
          sets: 3,
          difficulty: ExerciseDifficulty.beginner,
          description: 'Isolate each side of your back with single-arm dumbbell rows. Use a bench for support and focus on pulling the weight towards your hip. This exercise targets the lats and rhomboids. Maintain a flat back and controlled movements.',
          materialNeeded: [
            ExerciseMaterial(title: 'Dumbbell', image: 'dumbbell_image.jpg'),
            ExerciseMaterial(title: 'Bench', image: 'bench_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Place one knee and hand on a bench, with the opposite foot on the ground. Hold a dumbbell in the free hand with an overhand grip.',
            ),
            ExerciseStep(
              title: 'Row',
              description: 'Pull the dumbbell towards your hip by retracting your shoulder blade. Keep your elbow close to your side and maintain a flat back.',
            ),
            ExerciseStep(
              title: 'Lower',
              description: 'Lower the dumbbell back to the starting position with controlled movements, maintaining a flat back.',
            ),
          ],
        ),
        Exercise(
          name: 'Hyper extensions',
          sets: 3,
          difficulty: ExerciseDifficulty.beginner,
          description: 'Strengthen the lower back with hyperextensions. Use a hyperextension bench or Roman chair. Keep your back straight and hinge at your hips. Focus on engaging your lower back muscles during the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Hyperextension Bench or Roman Chair', image: 'hyperextension_bench_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Position yourself on the hyperextension bench with your thighs against the pads and your feet secured. Cross your arms over your chest.',
            ),
            ExerciseStep(
              title: 'Extension',
              description: 'Hinge at your hips and lower your upper body towards the ground. Maintain a straight back and engage your lower back muscles.',
            ),
            ExerciseStep(
              title: 'Return',
              description: 'Raise your upper body back to the starting position with controlled movements. Focus on the contraction in your lower back.',
            ),
          ],
        ),
        Exercise(
          name: 'Seated Cable Rows',
          sets: 3,
          difficulty: ExerciseDifficulty.beginner,
          description: 'Target the middle back with seated cable rows. Use a cable machine with a V-bar attachment. Sit on the machine, grip the handles, and pull towards your lower chest. Focus on squeezing your shoulder blades together at the end of the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Cable Machine with V-Bar Attachment', image: 'cable_machine_v_bar_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Sit at the cable row machine with your feet on the platform, knees slightly bent. Grip the V-bar with both hands.',
            ),
            ExerciseStep(
              title: 'Row',
              description: 'Pull the handles towards your lower chest by squeezing your shoulder blades together. Keep your back straight and maintain a controlled pace.',
            ),
            ExerciseStep(
              title: 'Release',
              description: 'Release the handles back to the starting position with controlled movements, fully extending your arms.',
            ),
          ],
        ),
        // Add more detailed exercises as needed
      ],
    ),
    Workout(
      name: 'Abs Workout',
      duration: 50,
      numExercises: 10,
      caloriesBurned: 400.0,
      cover: "https://cdn2.iconfinder.com/data/icons/exercise-and-gym-line-color-stay-healthy/512/Exercise001-512.png",
      img: "https://1.bp.blogspot.com/-cD7sdqqzG0g/VQ2evplgxmI/AAAAAAAAA-0/xXlK6umra_0/s1600/abs-six-pack-muscles.jpg",
      exercises: [
        Exercise(
          name: 'Dead Lift',
          sets: 4,
          difficulty: ExerciseDifficulty.intermediate,
          description: 'Build overall back strength with dead lift. This compound exercise targets the erector spinae, lats, and traps. Use a barbell with proper form, keeping your back straight and engaging your core throughout the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Barbell', image: 'barbell_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Stand with your feet hip-width apart and grip the barbell with hands slightly wider than shoulder-width apart.',
            ),
            ExerciseStep(
              title: 'Lift',
              description: 'Engage your core and lift the barbell by straightening your hips and knees. Keep the barbell close to your body throughout the movement.',
            ),
            ExerciseStep(
              title: 'Lower',
              description: 'Lower the barbell back to the ground with controlled movements, maintaining a neutral spine. Bend at your hips and knees.',
            ),
          ],
        ),
        Exercise(
          name: 'Lat Pulldowns',
          sets: 3,
          difficulty: ExerciseDifficulty.beginner,
          description: 'Target the latissimus dorsi with lat pulldowns. Use a cable machine with an overhead bar. This exercise helps build a V-shaped back. Focus on a controlled range of motion and squeezing your lats at the bottom of the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Cable Machine', image: 'cable_machine_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Sit facing the cable machine with a straight back. Adjust the knee pads to secure your legs in place. Grip the overhead bar with hands slightly wider than shoulder-width apart.',
            ),
            ExerciseStep(
              title: 'Pull',
              description: 'Pull the bar down to your chest by engaging your lat muscles. Keep your elbows close to your sides and focus on the contraction at the bottom of the movement.',
            ),
            ExerciseStep(
              title: 'Release',
              description: 'Release the bar back to the starting position with controlled movements, fully extending your arms.',
            ),
          ],
        ),
        Exercise(
          name: 'Bent Over Rows',
          sets: 4,
          difficulty: ExerciseDifficulty.beginner,
          description: 'Strengthen the upper back and lats with bent-over rows. Use a barbell or dumbbells and maintain a flat back throughout the exercise. Focus on pulling the weight to your lower chest while keeping your elbows close to your sides.',
          materialNeeded: [
            ExerciseMaterial(title: 'Barbell or Dumbbells', image: 'barbell_dumbbells_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Stand with your feet hip-width apart, holding a barbell or dumbbells with an overhand grip. Bend at your hips until your torso is almost parallel to the ground.',
            ),
            ExerciseStep(
              title: 'Row',
              description: 'Pull the weight to your lower chest by squeezing your shoulder blades together. Keep your elbows close to your sides and maintain a flat back.',
            ),
            ExerciseStep(
              title: 'Lower',
              description: 'Lower the weight back to the starting position with controlled movements, maintaining a flat back.',
            ),
          ],
        ),
        Exercise(
          name: 'Pull-Ups',
          sets: 3,
          difficulty: ExerciseDifficulty.advanced,
          description: 'Challenge your upper back and lats with pull-ups. This bodyweight exercise targets multiple muscle groups. Grip a pull-up bar with hands slightly wider than shoulder-width apart. Focus on a full range of motion and controlled movements.',
          materialNeeded: [
            ExerciseMaterial(title: 'Pull-Up Bar', image: 'pull_up_bar_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Hang',
              description: 'Hang from the pull-up bar with an overhand grip, arms fully extended and slightly wider than shoulder-width apart.',
            ),
            ExerciseStep(
              title: 'Pull-Up',
              description: 'Pull your body up towards the bar by engaging your lats. Keep your core tight and focus on a controlled ascent.',
            ),
            ExerciseStep(
              title: 'Lower',
              description: 'Lower your body back to the hanging position with controlled movements. Maintain a straight line from head to heels.',
            ),
          ],
        ),
        Exercise(
          name: 'T-Bar Rows',
          sets: 3,
          difficulty: ExerciseDifficulty.intermediate,
          description: 'Isolate the middle back with T-bar rows. Use a T-bar row machine or landmine attachment. Maintain a flat back and focus on pulling the weight towards your lower chest. This exercise targets the rhomboids and lats.',
          materialNeeded: [
            ExerciseMaterial(title: 'T-Bar Row Machine or Landmine Attachment', image: 't_bar_row_machine_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Place the bar in the T-bar row machine or landmine attachment. Stand with your chest against the pad, gripping the handles with an overhand grip.',
            ),
            ExerciseStep(
              title: 'Row',
              description: 'Pull the weight towards your lower chest by retracting your shoulder blades. Keep your elbows close to your sides and maintain a flat back.',
            ),
            ExerciseStep(
              title: 'Lower',
              description: 'Lower the weight back to the starting position with controlled movements, maintaining a flat back.',
            ),
          ],
        ),
        Exercise(
          name: 'Face Pulls',
          sets: 3,
          difficulty: ExerciseDifficulty.intermediate,
          description: 'Target the rear delts and upper traps with face pulls. Use a cable machine with a rope attachment. Stand facing the machine and pull the rope towards your face. Focus on squeezing your shoulder blades together at the end of the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Cable Machine with Rope Attachment', image: 'cable_machine_rope_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Set the cable machine to chest height and attach a rope. Stand facing the machine, holding the ends of the rope with an overhand grip.',
            ),
            ExerciseStep(
              title: 'Pull',
              description: 'Pull the rope towards your face by squeezing your rear delts and upper traps. Focus on the contraction at the end of the movement.',
            ),
            ExerciseStep(
              title: 'Release',
              description: 'Release the rope back to the starting position with controlled movements, maintaining a neutral spine.',
            ),
          ],
        ),
        Exercise(
          name: 'Single-Arm Dumbbell Rows',
          sets: 3,
          difficulty: ExerciseDifficulty.beginner,
          description: 'Isolate each side of your back with single-arm dumbbell rows. Use a bench for support and focus on pulling the weight towards your hip. This exercise targets the lats and rhomboids. Maintain a flat back and controlled movements.',
          materialNeeded: [
            ExerciseMaterial(title: 'Dumbbell', image: 'dumbbell_image.jpg'),
            ExerciseMaterial(title: 'Bench', image: 'bench_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Place one knee and hand on a bench, with the opposite foot on the ground. Hold a dumbbell in the free hand with an overhand grip.',
            ),
            ExerciseStep(
              title: 'Row',
              description: 'Pull the dumbbell towards your hip by retracting your shoulder blade. Keep your elbow close to your side and maintain a flat back.',
            ),
            ExerciseStep(
              title: 'Lower',
              description: 'Lower the dumbbell back to the starting position with controlled movements, maintaining a flat back.',
            ),
          ],
        ),
        Exercise(
          name: 'Hyper extensions',
          sets: 3,
          difficulty: ExerciseDifficulty.beginner,
          description: 'Strengthen the lower back with hyperextensions. Use a hyperextension bench or Roman chair. Keep your back straight and hinge at your hips. Focus on engaging your lower back muscles during the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Hyperextension Bench or Roman Chair', image: 'hyperextension_bench_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Position yourself on the hyperextension bench with your thighs against the pads and your feet secured. Cross your arms over your chest.',
            ),
            ExerciseStep(
              title: 'Extension',
              description: 'Hinge at your hips and lower your upper body towards the ground. Maintain a straight back and engage your lower back muscles.',
            ),
            ExerciseStep(
              title: 'Return',
              description: 'Raise your upper body back to the starting position with controlled movements. Focus on the contraction in your lower back.',
            ),
          ],
        ),
        Exercise(
          name: 'Seated Cable Rows',
          sets: 3,
          difficulty: ExerciseDifficulty.beginner,
          description: 'Target the middle back with seated cable rows. Use a cable machine with a V-bar attachment. Sit on the machine, grip the handles, and pull towards your lower chest. Focus on squeezing your shoulder blades together at the end of the movement.',
          materialNeeded: [
            ExerciseMaterial(title: 'Cable Machine with V-Bar Attachment', image: 'cable_machine_v_bar_image.jpg'),
          ],
          howItsDone: [
            ExerciseStep(
              title: 'Setup',
              description: 'Sit at the cable row machine with your feet on the platform, knees slightly bent. Grip the V-bar with both hands.',
            ),
            ExerciseStep(
              title: 'Row',
              description: 'Pull the handles towards your lower chest by squeezing your shoulder blades together. Keep your back straight and maintain a controlled pace.',
            ),
            ExerciseStep(
              title: 'Release',
              description: 'Release the handles back to the starting position with controlled movements, fully extending your arms.',
            ),
          ],
        ),
        // Add more detailed exercises as needed
      ],
    ),
  ];

  @override
  void onClose() {
    selectedDifficultyIdx = 0;
    super.onClose();
  }
}
