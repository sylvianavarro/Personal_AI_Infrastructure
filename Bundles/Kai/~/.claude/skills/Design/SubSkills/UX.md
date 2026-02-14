# Design:UX Sub-Skill

Deep expertise in Laws of UX, Nielsen Norman heuristics, Gestalt principles, and cognitive psychology for interface design.

## Laws of UX

### Fitts's Law
- **Core**: Time to acquire target = function of distance and size
- **Size**: Touch targets large enough for accurate selection (44x44px minimum)
- **Spacing**: Ample spacing between targets
- **Placement**: Place targets in areas allowing easy access
- **Application**: Large buttons on mobile, interactive elements near cursor/thumb zones

### Hick's Law (Hick-Hyman Law)
- **Core**: Decision time increases logarithmically with number of choices
- **Minimize choices**: Critical when response times matter
- **Smaller steps**: Break complex tasks into smaller steps
- **Recommended options**: Highlight recommendations to reduce cognitive load
- **Warning**: Don't simplify to the point of abstraction

### Jakob's Law
- **Core**: Users transfer expectations from familiar products
- **Expectations**: Users expect your product to work like others they know
- **Mental models**: Leverage existing patterns so users focus on tasks, not learning
- **Minimize discord**: When changing, allow continued use of familiar version

### Miller's Law
- **Core**: Working memory holds approximately 7±2 items
- **Don't abuse it**: Don't use "magic number seven" to justify unnecessary limitations
- **Chunks**: Organize content into smaller chunks for easier processing
- **Context matters**: Short-term memory varies per individual and situation

### Doherty Threshold
- **Core**: Productivity soars when response time < 400ms
- **System feedback**: Provide feedback within 400ms to maintain attention
- **Perceived performance**: Use techniques to improve response time feel
- **Animation**: Visually engage users during loading
- **Purposeful delay**: Sometimes delay increases perceived value

### Goal-Gradient Effect
- **Core**: Motivation increases as users approach goal completion
- **Artificial progress**: Providing initial progress helps ensure task completion
- **Progress indication**: Clear indication motivates task completion
- **Application**: Progress bars, step indicators, completion percentages

### Peak-End Rule
- **Core**: Experiences judged by peak intensity and final moments, not average
- **User journey**: Pay attention to most intense points and final moments
- **Design for delight**: Delight users at peak and end moments

### Serial Position Effect
- **Core**: First and last items in series recalled best
- **Placement**: Place least important items in middle of lists
- **Navigation**: Position key actions on far left/right
- **Primacy/Recency**: First items → long-term memory; Last items → working memory

### Tesler's Law (Conservation of Complexity)
- **Core**: Every system has inherent complexity that cannot be removed
- **Complexity burden**: Lift burden from users during design/development
- **Warning**: Don't simplify interfaces to point of abstraction

### Von Restorff Effect (Isolation Effect)
- **Core**: Distinctive items among similar items remembered better
- **Visual distinction**: Make important info/actions visually distinctive
- **Restraint**: Avoid elements competing; salient items shouldn't look like ads
- **Accessibility**: Don't rely solely on color; consider color vision deficiency

### Zeigarnik Effect
- **Core**: Incomplete tasks remembered better than completed ones
- **Content discovery**: Provide clear signifiers of additional content
- **Artificial progress**: Initial progress motivates completion
- **Progress indication**: Clear progress motivates task completion

### Principle of Least Effort
- **Core**: People want information as quickly and simply as possible
- **Show, don't tell**: Demonstrate with examples instead of text
- **Progressive disclosure**: Let users choose if they want more detail
- **Limit to necessary**: Only ask for absolutely necessary information

## Gestalt Principles

| Principle | Description | Application |
|-----------|-------------|-------------|
| **Proximity** | Close items perceived as related | Group related form fields |
| **Similarity** | Similar items perceived as related | Consistent button styles |
| **Common Region** | Items in bounded areas perceived as grouped | Card containers |
| **Continuity** | Eye follows smooth paths | Aligned content |
| **Closure** | Mind completes incomplete shapes | Icons, logos |
| **Figure/Ground** | Distinguish foreground from background | Modals, overlays |

## Interaction Principles (Don Norman)

### Affordances
- Actions that are *possible* with an object
- Form implies function (raised buttons imply pressing)
- Connect what object does to user's conceptual model

### Signifiers
- Show how and where people can interact
- Use labels, arrows, icons, sounds to guide
- Example: Horizontal bar = push door; Handle = pull door

### Feedback
- Communicate current state of system
- Loading bars give "behind the scene" information
- Never leave users guessing about action taken

### Mental Models
- Match designs to users' existing mental models
- Radically redesigning conventions risks alienating users
- E-commerce uses consistent patterns for a reason

## Nielsen Norman Heuristics

1. **Visibility of system status** - Keep users informed
2. **Match system and real world** - Use familiar language
3. **User control and freedom** - Undo/redo, escape hatches
4. **Consistency and standards** - Follow conventions
5. **Error prevention** - Prevent problems before they occur
6. **Recognition over recall** - Minimize memory load
7. **Flexibility and efficiency** - Shortcuts for experts
8. **Aesthetic and minimalist design** - Remove unnecessary elements
9. **Help users with errors** - Plain language, suggest solutions
10. **Help and documentation** - Easy to search, task-focused

## Cognitive Load

- **Intrinsic**: Effort to absorb relevant information (3-4 items max)
- **Extraneous**: Processing that doesn't help understanding (distractions)
- **Goal**: Minimize extraneous load, chunk intrinsic load appropriately

## Audit Checklist

- [ ] Primary actions clearly distinguished (Von Restorff)
- [ ] Choices minimized per screen (Hick's Law)
- [ ] Click/touch targets adequately sized 44x44px+ (Fitts's Law)
- [ ] Information chunked appropriately (Miller's Law)
- [ ] Progress indicators present where needed (Goal-Gradient)
- [ ] Follows platform conventions (Jakob's Law)
- [ ] Response times under 400ms or perceived as such (Doherty)
- [ ] Visual hierarchy clear (Gestalt principles)
- [ ] Error states helpful and actionable (NN heuristic 9)
- [ ] System status visible (NN heuristic 1)
- [ ] Affordances and signifiers clear (Norman)
- [ ] Cognitive load minimized (chunking, progressive disclosure)
