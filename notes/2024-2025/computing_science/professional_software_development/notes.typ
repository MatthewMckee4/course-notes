#set document(title: "Professional Software Development")
#set page(margin: 20pt)
#set quote(block: true)

= Professional Software Development

== Intro

*Software is intrinsically*: complex, intangible, malleable, scalable and evolutionary.

== Agile Team Organisation

*What is Agile?* Small teams, frequent structured meetings, small deliveries, customer engagement.
Maintenance techniques like continual testing, analysis, refactoring.
Change of project objectives and priorities is constant.
Frequent review of software process.

*Agile Methods*: TDD, BDD, Planning Poker, Scrum, Kanban, CI/CD.

*Risk of Agile*: Lack of customer engagement, poor code quality, poor team coordination, stakeholder conflict.

*Roles in Scrum*: Product Owner, Scrum Master, Team Manager, Quality Assurance manager, Chief Architect, Developer.

*Managing work in Scrum*: Work is organisted into releases and sprints.
Begin first sprint with a project launch meeting.
Begin a sprint with a planning meeting, end with review meeting and retrospective.
Stand-ups take place throughout the sprint to review progress.

*Project launch meeting* determines major features to deliver, identify a MVP, develop initial user stories,
establish cost estimates and priorities.

*Release planning meeting* long projects have multiple releases, identify high level features, create a roadmap of milestones.

*Sprint Planning Meetings*: decide on a main goal for the sprint: features, bugs, refactors. Select tasks from the backlog.

*Stand-ups* are used for each member to reflect on progress, blockers, and next steps. Max 10 minutes.

*Managing delays* can be done by getting an extension or reducing feature set.

*Review* the project in the sprint review meeting and the process in the retrospective. Deliver and demonstrate new version to customer.
summarise completed work, identify new feature set.

== Change Management

*Control items* are any artifacts that a software engineer might directly edited.

*Centralised version control system* has a single centralised repository somewhere on a server.
Each dev has a local copy. Changes are pushed to the central repo.

*Distributed version control system* has a repository on each machine.
Each repo can be linked to other repos.

*Commits* are saved with a hash for uniquely identifying the changes.

*Branching* is used for maintaining multiple development lines.
*Trunk-based development* invloves commiting to one main branch, useful for reducing merge conflicts, requires developers to make smaller changes,
and provides clear visibility of project process.
*Feature Branching* is more convenient for managing code reviews.
*Staging branches* are used after making a commit to the main branch, some testing is done here then a push is made to the deployment branch.
Manage branches by deleting them and squash commiting.

== Customer Management

*First customer meeting*: decide on rules of engagement, clarify overall goals, identify stakeholders, determine appropriate IP ownership,
identify any significant risks, decide on goals for first sprint.

*Intellectual property and licensing* is a complex issue. Both parties may contribute background IP.

*Customer meetings*: set an agenda, use time boxing, have roles.

== Requirements Management

Cannot isolate the requirements from the implementation.

*Actors*: categories of users, motiviation.

*Non-functional requirements*: can be expressed as user stories.

*Functional requirements*: what the system does.

*User stories*: a short description of a feature from the user's perspective. Used to document the requirements for a software system.

== Software Process Improvement

*Process improvement frameworks*: *ISO 9001*, *Six Sigma*, *CMMI*.

*Goal* is to arrive at the root cause when discussing challenges in ret-rospectives.
These meetings, unfortunately, are infrequent by nature and issues early in the sprint may be hard to recall.
It is important to vary the retrospective structure.

*How* this is done: gather data, analyse data, identify root causes, implement changes.

== Code Reviews

*Purpose* is to detect defects, identify refactoring opportunities, develop a shared understanding of the codebase.

*Merge requests* should be small: 300 lines and/or require 30 minutes to review.
Should choose one of: corrective, adaptive, preventative, perfective.
A code review should adhere to architectural patterns and re-use existing code.

== Build, Release and Dependency Management

A software project should have a *build configuration file*. This specifies targets (resolve dependencies, compile code, test binary),
mappings (relationship between source and generated artifacts), tasks (actions to satisfy mappings, e.g. execute a specific compiler).

*Types of dependencies*: environmental, application

*Types of releases*: Core executable, Tailored executable, Optional extensions, Sources, Documentation (compositions).
Bleeding edge/snapshot, Beta test release, Production release (schedule intent).

*Types of APIs*: Private, Public
Published (APIs that can be externally access but not explicitly documented as being part of the public API).

*Specifying dependencies*: project almost always has transitive dependencies, do not rely on them.

*Semantic versioning*: major.minor.incremental[-tag]

*Deprecated feature*: Left in for compatibility, but intended to be removed in future releases.

*Migration plans and scripts*: adapting existing code to use new published APIs.

== Continuous Integration

*Integration hell*: Spending more time re-integrating features, than in creating the features.

*Continuous Integration Practices*: change management, quality assurance, deployment.

*Broken build*: the highest-priority for a team; other operations must momentarily cease.
*Build times*: should be less than 10 minutes.

*Staging platform*: Used to test software before being released to users.
Limitations include lack of realism, too many simultaneous users, network endpoints and data sets inaccessible outside of production.
Multiple staging environments may be needed when several components, each of which intended for use on a different platform, exist.

== Static Analysis, Readability and Design Quality

*Static vs Dynamic analysis*: The former is applied on program artefacts at rest, while the latter is conducted during execution.

*Fan-in (afferent coupling) complexity*: Number of inbound references to a class from other classes. Identifies the number of classes that will need to be modified if the subjected class is changed.

*Fan-out (efferent coupling) complexity*: Number of outbound references for a given class. Determines the frequency that the class in question will need to change.

*Inheritance depth and width*: Deep inheritance suggests an over-abstraction of the class.

== Behaviour-driven development

*Given*: To set up the test case fixture, initialize the necessary components and dependencies required for the test. This may include creating mock objects, setting up the database state, or configuring the environment to ensure that the test runs in isolation.

*When*: During the test case execution, invoke the method or function under test with the specified inputs. Ensure that all necessary preconditions are met and that the system is in the correct state to perform the operation.

*Then*: After executing the test case, assert the expected outcomes. This includes checking the state of the system, verifying that the correct outputs are produced, and ensuring that any side effects (such as changes to the database or external systems) are as expected. Use assertions to confirm that the actual results match the expected results.

== Evaluating Test Suites

The more *effective* a test is, the less *efficient* it becomes.

*Mutation testing*: works by representing the introduction of defects into a system as combinations of small-scale code mutations of the target system's code.

*Mutant operations*: conditional operators with their boundary counterpart.

*Killed mutants*: successfully detected by the test suite.
*Survivor mutants*: successfully pass all tests and are undetected.
*Undetermined mutants*: programs that do not halt.

== System Scale Testing

*Reliability testing*: PFD (probability of failure on access), meantime to failure (time for system to fail from initiation,
or time be-tween failures; good metric when repair is expensive), down-time (useful when system is high-demand).

*Hostile system environment*: A system environment may be considered hostile if there is a rationalization for why threats/attackers may wish to exploit it.

*Fuzz testing*: Providing unusual inputs.
*Penetration testing*: An attacking team attempts to gain unauthorized access with the expected tools of a hacker.

*Heterogenous systems*: The greater the variation in organisational culture the harder it is to develop a consistent testing programme. Despite agreed standards, variations inevitably occur.

*Social-technical systems*: incorporate both computer software and hardware, the computer system's users, and the surrounding organ-isational and cultural practices.

*Systems of systems*: represents multiple heterogeneous semi-autonomous systems that cooperate or are coordinated to produce emergent effects.

*Feedback from the wild*: Crash reporting, A/B testing.

== Software Architecture

*Software component*: refers to a software bundle of self contained state and behaviours with well defined interfaces. Some components require functions provided by other components.

*Objects versus Components*:
Components are specializations of the object-class type.
Components are long-living entities, deployed for the full life-time of a software system.
Component middle-ware allows components to distribute be-tween different component environments and different hard-ware.
Cannot interact with component implementation directly likeyou can with objects.
Each of the interfaces provided by a component may be re-alised by a different object within the component.

*Why not componentize every object?*:
Communication costs increase from mediating (middleware) component interaction.
Development costs: documentation of component interfaces need to be maintained.

*Types of components*: general purpose, application specific.

*Design by contract*: benefits of using the interface as offered by the providing com-ponent, obligations imposed on the component that uses the interface

*Leaky abstractions*: whenever two component implementations (aprovider and a requirer of an interface) are wired together, theirfuture is influenced by assumptions on how theinterface will beutilizedandrealized.

*Architectural patterns*: Model View Control, Client-Server, Peer-to-Peer, Message-oriented architecture, Pipe and Filter, Plugin architecture.

*Thin-client architecture*: Purist approach to client-server. Clientscontain minimal logic.

*Fat-client architecture*: Clients perform more logic. Reduces com-munication with server by caching information.

*Peer-to-peer*: Resolves issue of resource scalibility. Every peer isa client and a server. All logic moved to clients (goes further thanfat-client).

*Information processing patterns*: Message-oriented architecture, pipe and filter.

*Message-oriented architectural pattern*: provides a basis for asyn-chronous communication.
Communication occurs as discrete mes-sages passing through a message bus, which re-routes to the appro-priate client based on routing policy.
*Message driven*: Computation in a component is the resultof message reception from another component.
*Message broker*: Deciding which component receives the mes-sage

*Pipe and Filter Architecture*: Each filter provides and implements the same interface, called the pipe.
The filtered wired into an assembly form a pipeline.
Data source component provides input and requires the pipe interface.
Data sink component provides the pipe interface on the rightto accept the system's output on the right.
To allow re-orderable filters each filter must provide and requirethe same interface.

*Plugin architecture* maintains a flexible mechanism for extension.
Plugins stored in plugin registry.
A Plugin provides an interface to the core application.
Loader component instantiates and configures the component for use by the main application, using the registry supplied specification.
Inner platform effect.

== Software Refactoring

Refactor when implementing new functionality, correcting defects, code reviews, trying to understand a software artefact.

*Code smells*: cloning, complex structures, long parameter lists, excessive comments

== Software Licensing

*A software license* can cover ownership, distribution rights, usage rights, liability, etc.

*Copyright*: The legal right to control the reproduction of a creative work for a specific time; varies between jurisdictions
*Warranty*: The length of time for which certain functionality can be expected/resolved.
*Liability*: Where the responsibility lies.

== Startup Growth Engineering

*Basic compounding growth loop*: Users attract other to consider product *if and only if* some of them use the product.
*Direct-invitational loop*: Users invite their colleagues *if and only if* some invitees sign-up.

*Traditional growth engineering*: Marketing (acquire users) and product engineering (build features).
*Compounding growth*: The rate of growth is proportional to the number of users.
*Churn*: The percentage of users lost after successive time periods.
*Optimizing growth cycle*: Quantify each stage of the growth cycle and see which stages can be improved. Gauge effects and continue.

#pagebreak()

== Case Study

You are working with a startup software company that is developing a new software product for coordinating multiple autonomous unmanned aerial vehicles (aUAVs), commonly referred to as drone swarms. The team comprises a team lead, four developers and a product owner, who is also the founder of the company.

Market research has shown that there is existing software for controlling drones in flight and that this has been used to create aerial light displays. The startup has decided to focus on the use of drone swarms for tasks in remote inhospitable environments. For example, swarms could be used to survey large areas of remote land where resources (such as timber or minerals) might be extracted, or assist search and rescue operations to find casualties. Larger drones might be used in a swarm to dispense water to control wild fires.

All of these applications will have to account for the physical constraints on the drones, such as their need to be recharged at different times, the impact of weather and the performance characteristics of different drones in the swarm.

The hardware components of the system comprise the drones themselves, equipped with a GPS and camera, a base station for sending communications to the drones, and a ruggedised laptop that will be used to control the swarm and also process the data collected.

So far, the architecture for the part of the system that coordinates the swarm has been implemented. Each drone establishes a connection to the base station so that it can receive instructions and send back data from its sensors. Instructions might tell the drone to fly in a particular direction, or go to a specific location. The software on the base station maintains control of several drones simultaneously, ensuring they don't collide. The software on the drone is responsible for processing the received commands.

You join the team as a Scrum Master at the point where they have been working on the user interface. The team have developed the following user journey to portray the overall vision for the project.

#quote[
    Kerry is the drone swarm operator for a mountain search and rescue team. The team have been called out to rescue two casualties following an avalanche in a mountainous area. Kerry switches on the drones and the base station at the bottom of the large search area. She configures the drones with the location of the base station so they can return when they need recharging. Using the controller she opens a mapping screen and selects survey mode. She then specifies a geographic region for the swarm to survey. The drone swarm launches and automatically organises itself into formation to complete the survey, which results in a new map layer composed of tiles of aerial photographs from different drones gradually appearing on the screen.

    Image recognition software on the laptop begins to identify tiles that might contain the casualty. Kerry selects each of these tiles in turn and chooses to open an album of photos taken of the location by the drones. The initial area for search doesn't contain any casualties so Kerry instructs the swarm to expand the survey area.

    When she finds a tile that she think contains a casualty she instructs the swarm to take a lower level detailed image of the exact location. One drone in the swarm flies lower and takes this picture, which gets returned to the laptop. Kerry tags the tile locations that contain the casualties. Kerry creates a "case" from the tile and photo collection and adds additional notes, such as the possible identity of the casualty, or if they appear to be conscious.

    Next Kerry informs the team leader who splits the team into parties to continue to monitor the most likely locations of the casualties. Kerry divides the swarm into sub-swarms. Then she sets each swarm to "loiter" mode at the likely locations. Each swarm maintains two drones "on-point" whilst the others return to the base station for recharging. The swarms swap over when the active drones need recharging.

    Once both the casualties are safely recovered the swarm is ordered to return to the base station for collection.
]

The UI will be written in a cross-platform framework that provides reusable components, such as Flutter. This will communicate with a backend API that will send instructions to the swarm.

The team follows a Scrum software development process. The team triage the user stories they have written for the user interface during a backlog grooming session.

First, each story is estimated following the Planning Poker method. The team lead reads out the story then each team member writes an estimate in person hours on a sticky note, before sharing this with the team. Stories can vary in scale considerably, so estimates can sometimes be many hundred person-hours. If the team are close to each other (within 10 person-hours) then the average is taken as the estimate, else the team go for another round of estimation. This continues until the team reach an acceptable consensus. Unsurprisingly, disagreement is most common for larger user stories, but the team usually coalesce on the median estimate from the first round after a short while.

Next, an individual developer identifies tasks necessary to realise the user story and records these on the team's issue tracker. An example task might be to add a new screen to the user interface, or extend the API to accept a new command. The developer then prioritises the tasks and assigns them to themselves. The tasks are also recorded on the user story as the "Definition of Done." Once all the issues have been created the team starts the sprint.

The following code for tracking information about a drone in the user interface was developed during the sprint.

```java
public class Drone {
    private final Set<Drone> swarm;
    private Coordinate location;
    private Long timestamp;
    private Double batteryLevel;
    private Clock clock;

    public Drone(Set<Drone> swarm, Clock clock) {
        this.swarm = swarm;
        this.clock = clock;
    }

    public Coordinate getLocation() {return location;}

    public void update(Long timestamp, Coordinate location, Double batteryLevel) {
        this.timestamp = timestamp;
        this.location = location;
        this.batteryLevel = batteryLevel;
    }

    public Double distanceTo(Drone drone) {
        return this.getLocation().distanceTo(drone.getLocation());
    }

    public Drone getNearestDrone() {
        Drone result = null;
        Double minDistance = MAX_VALUE;
        for (Drone drone : this.swarm) {
            if (drone == this) continue;
            Double distance = drone.distanceTo(this);
            if (distance < minDistance)
                result = drone;
                minDistance = distance;
        }
        return result;
    }

    public DroneStatus getStatus(){
        Drone nearest = getNearestDrone();
        Boolean veryClose = nearest != null &&
                nearest.distanceTo(this) < 50.0;
        if (this.batteryLevel < 10.0 || veryClose)
            return CRITICAL;
        else if (this.clock.millis() - this.timestamp > 60000)
            return UNKNOWN;
        else return OPERATIONAL;
    }
}
```
