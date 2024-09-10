<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title>Unleash Efficiency, Collaboration, and High-Quality Delivery</title>
    <style>
        body, h1, h2, h3, h4, h5, h6, p, a, span, button, label, option, select {
            font-weight: 900;
            font-size: 1.2em;
            color: whitesmoke;
        }

        #toolSelect {
            color: black;
            background-color: whitesmoke;
        }

        #toolImage {
            max-width: 300px;
            float: right;
            margin: 20px;
        }

        body {
            background-image: url("images/background1.jpg");
            background-repeat: repeat;
            background-size: auto;
            position: relative;
            min-height: 100vh;
        }

        .logo {
            text-align: center;
            margin-top: 20px;            
        }

        .main-title {
            text-align: center;
            margin-top: 2vh;
        }

        .link {
            cursor: pointer;
            text-decoration: underline;
            margin-left: 15px;
        }

        .link:hover {
            text-decoration: none;
        }

        /* hidden by default */
        .about-content, .tool-content {
            display: none;
            width: 70%;
            margin: 20px auto;
            text-align: center;
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .content-section {
            display: flex;
            justify-content: space-between;
        }

        .tool-section {
            width: 45%;
        }

        #topRight {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        #homeButton {
            position: absolute;
            top: 10px;
            left: 10px;
            background-color: whitesmoke;
            color: black;
        }

    </style>
</head>
<body>

<button id="homeButton" onclick="showHomePage()">Home</button>

 <div class="logo">
    <img src="images/logo1.png" width="200" height="100" alt="Company Logo">
    <h1 class="main-title">Unleash Efficiency, Collaboration, and High-Quality Delivery!</h1>
</div>
    
<div id="topRight">
    <span class="link" id="aboutLink">Ezlearn Academy</span> 
    <span class="link" id="careersLink">Careers</span>
</div>
    
<div class="content-section">
    <div class="tool-section">
        <img src="images/cartoon.jpg" alt="A student with a laptop" style="display:block; margin:auto;">
        <h2>Select DevOps Tool For Details</h2>
        <img id="toolImage" src="" alt="Tool Image" style="display: none; width: 300px; margin: 20px auto;">
        <select name="tool" id="toolSelect" onchange="showToolDetails(this.value)">
            <option value="" selected>Select a tool...</option>
            <option value="Git">Git</option>
            <option value="Jenkins">Jenkins</option>
            <option value="Ansible">Ansible</option>
            <option value="Terraform">Terraform</option>
            <option value="Docker">Docker</option>
             <option value="Kubernetes">Kubernetes</option>
        </select>
        <div id="toolDetails"></div>
    </div> 
      
    <div class="about-content" id="aboutContent">
        <p>Where Technology and Expertise Intersect!</p>
        <p>Our Two-Fold Mission:</p>
        <ol>
            <li>DevOps Support: We understand that each business is unique, and so are its technological challenges. Our seasoned team boasts a rich tapestry of experience in offering bespoke DevOps support...</li>
            <li>Education & Training: As firm believers in sharing knowledge, we are equally passionate about fostering the next generation of DevOps engineers...</li>
        </ol>
    </div>
</div>

<!-- Contact Us Form -->
<div style="position: fixed; bottom: 10px; right: 10px;">
    <h2>Contact Us</h2>
    <form action="/contact" method="post">
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br><br>
        <label for="details">Details:</label><br>
        <textarea id="details" name="details" rows="4" required></textarea><br><br>

        <button type="submit">
            <img src="images/send.jpg" alt="Send" style="width: 20px; height: 20px;">
            Send
        </button>
    </form>
</div>

<script>
    document.getElementById('homeButton').addEventListener('click', showHomePage);
    document.getElementById('aboutLink').addEventListener('click', function() {
        document.querySelector('.logo').style.display = 'none';
        document.querySelector('.content-section').style.display = 'none';
        document.getElementById('aboutContent').style.display = 'block';
    });
    document.getElementById('toolSelect').addEventListener('change', function() {
        showToolDetails(this.value);
    });

    function showHomePage() {
        document.getElementById('aboutContent').style.display = 'none';
        document.querySelector('.logo').style.display = 'block';
        document.querySelector('.content-section').style.display = 'flex';
        document.getElementById('toolSelect').value = ""; // Reset tool dropdown
        document.getElementById('toolDetails').innerHTML = ''; // Clear tool details
    }

    function showToolDetails(tool) {
        let details = '';
        let imagePath = '';
        switch (tool) {
            case 'Git':
                details = `
               <h3>Git</h3>
               Git is a distributed version control system (VCS) that helps track changes in source code during software development.  It is designed for coordinating work among programmers, but it can be used to track changes in any set of files.  
               <ul>
                   <li><strong>Distributed Version Control:</strong> Every developer's working copy of the code is also a repository that can contain the full history of all changes. This model allows for more flexibility and collaborative workflows.</li>
                   <li><strong>Branching and Merging:</strong> Efficient handling of branches and merges efficiently. Developers can easily create branches to work on new features or bug fixes and can merge these branches back into the main codebase when the work is complete..</li>
                   <li><strong>Speed:</strong> Git is designed with performance in mind. Operations such as branching and merging are extremely fast, which encourages workflows that branch often, even for small changes.</li>
                   <li><strong>Data Integrity:</strong> Every file and commit is check-summed using the SHA-1 hash algorithm, which guarantees the consistency and integrity of data over time.</li>
                   <li><strong>Staging Area:</strong> An intermediate area for changes before committing them to the repository. This allows developers to craft their commits for clarity and purpose.</li>
                   <li><strong>Non-linear Development:</strong> Git supports non-linear development through its robust handling of branches, allowing multiple paths of development to occur simultaneously.</li>
                   <li><strong>Collaboration:</strong> Git’s distributed nature allows multiple developers to work concurrently. Combined with platforms like GitHub or GitLab, it provides a centralized place for collaboration, code review, issue tracking, and more.</li>
                   <li><strong>Open Source:</strong> Git is free and open-source software. Its development is supported by a vast community that continuously works on improvements and new features.</li>
               </ul>
               Git was initially designed and developed by Linus Torvalds in 2005, , for the development of the Linux kernel itself. Since then, it has gained widespread acceptance in the software community, making it the de facto standard for version control in many projects and organizations.
               <br><br>
               <strong>Installation Guide for Ubuntu:</strong><br>
               1. sudo apt update<br>
               2. sudo apt install git<br>
               3. git --version
               `;
               imagePath = 'images/git.jpg'
               break;

            case 'Jenkins':
                details = `
               <h3>Jenkins</h3>
               Jenkins is an open-source automation server that facilitates the automation of various stages of the software development process. With its vast plugin ecosystem, Jenkins supports building, deploying, and automating projects.   
               <ul>
                   <li><strong>Automation:</strong> Jenkins allows for automation of the various stages of the build and deployment processes, making the entire software lifecycle faster and more efficient..</li>
                   <li><strong>Plugins:</strong> With thousands of plugins in its ecosystem, Jenkins integrates with virtually every tool in the continuous integration and continuous delivery (CI/CD) toolchain..</li>
                   <li><strong>Distributed Builds:</strong> Jenkins can distribute build and test jobs across multiple machines, enabling faster builds, tests, and deployments..</li>
                   <li><strong>Easy Setup:</strong> Jenkins offers a simple setup process and web-based graphical user interface for management..</li>
                   <li><strong>Platform Independent:</strong> Jenkins is written in Java, making it platform-independent and capable of running on various operating systems..</li>
                   <li><strong>Scalability:</strong> Jenkins can scale upwards and outwards by distributing tasks across multiple machines..</li>
                   <li><strong>Community Support:</strong> With a large and active community, Jenkins has a wealth of community-written documentation, shared best practices, and forums..</li>
                   <li><strong>Open Source:</strong> Jenkins is free to use and its source code is available on GitHub, allowing for customization and extension by developers..</li>
               </ul>
               Jenkins was initially developed by Kohsuke Kawaguchi in 2004 as the "Hudson" project. It was renamed to Jenkins in 2011 after a dispute with Oracle.
               <br><br>
               <strong>Installation Guide for Ubuntu:</strong><br>
               1. wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -<br>
               2. sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'<br>
               3. sudo apt update<br>
               4. sudo apt install jenkins<br>
               5. sudo systemctl start jenkins<br>
               6. sudo systemctl enable jenkins<br>
               7. After installing Jenkins, it will run on the default port 8080. You can access it by navigating to http://your_server_ip:8080. On the first run, it will ask for an unlock key which can be found in /var/lib/jenkins/secrets/initialAdminPassword. After this, you can set up the initial admin user and install the desired plugins based on your needs.<br>
               `;
               imagePath = 'images/jenkins.jpg'
               break;               

            case 'Ansible':
                details = `
               <h3>Ansible</h3>
               Ansible is an open-source automation tool that facilitates configuration management, application deployment, task automation, and even IT orchestration. With its agentless architecture, Ansible simplifies complex automation tasks without requiring any software or agent installation on the client-side. Here are some key features and points about Ansible:  
               <ul>
                   <li><strong>Agentless:</strong> Unlike other automation tools, Ansible does not require any agent or software to be installed on the nodes it manages. It typically uses SSH for communication..</li>
                   <li><strong>YAML Playbooks:</strong> Ansible tasks and playbooks are written in YAML, making them easy to write and understand. A playbook defines a series of tasks to be executed on a managed node..</li>
                   <li><strong>Modules:</strong> Ansible comes with a multitude of built-in modules that help perform a wide range of tasks on remote hosts..</li>
                   <li><strong>Idempotency:</strong> Ansible ensures that operations are idempotent, meaning running the same task multiple times won't change the system's state any further after its first application..</li>
                   <li><strong>Flexibility:</strong> It can manage both Unix-like systems and Microsoft Windows systems using PowerShell..</li>
                   <li><strong>Extensibility:</strong> If Ansible's built-in modules don't suffice, users can write their custom modules..</li>
                   <li><strong>Vault:</strong> Ansible Vault is a feature that allows users to keep sensitive data such as passwords or keys in encrypted files, rather than as plaintext in playbooks or roles..</li>
                   <li><strong>Inventory:</strong> Ansible uses an inventory file to determine which hosts to work against. This inventory can be static or dynamic and can be sourced from various places, making it adaptable to various infrastructural needs..</li>
               </ul>
               Ansible has a strong community that contributes back to the tool. Ansible Galaxy is a community hub where users can share Ansible roles, which are pre-defined Ansible configurations, allowing others to use them in their own playbooks.
               <br><br>
               <strong>Installation Guide for Ubuntu:</strong><br>
               1. sudo apt update<br>
               2. sudo apt install software-properties-common<br>
               3. sudo apt-add-repository --yes --update ppa:ansible/ansible<br>
               4. sudo apt install ansible<br>
               5. ansible --version
               `;
               imagePath = 'images/ansible.png'
               break;               

            case 'Terraform':
                details = `
               <h3>Terraform</h3>
               Terraform is an open-source infrastructure as code (IaC) software tool developed by HashiCorp. It allows users to define and provision a data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL), or optionally JSON  
               <ul>
                   <li><strong>Declarative Language:</strong> Terraform uses a declarative approach, where you specify the desired end-state without having to list the steps to achieve that state. This makes the code more readable and easier to maintain..</li>
                   <li><strong>Infrastructure as Code (IaC):</strong> With Terraform, infrastructure is expressed in code, which can be versioned and treated just like any software codebase..</li>
                   <li><strong>Provider Ecosystem:</strong> Terraform supports a wide array of cloud providers and services, such as AWS, Google Cloud, Azure, and many others. This is facilitated through Terraform providers, which are plugins for specific platforms or tools..</li>
                   <li><strong>Immutable Infrastructure:</strong> Terraform promotes the idea of immutable infrastructure. Instead of making in-place modifications, Terraform provisions a new set of resources based on your configuration and replaces the old ones..</li>
                   <li><strong>State Management:</strong> Terraform keeps a persistent state record of your infrastructure. This allows it to determine what actions are necessary to achieve the desired state.</li>
                   <li><strong>Modularity:</strong> You can create reusable infrastructure components called modules. These modules can be shared within your organization or with the broader community..</li>
                   <li><strong>Collaboration:</strong> Terraform supports team-based workflows with features like remote backends and state locking. This prevents concurrent runs, which can cause conflicts and inconsistencies..</li>
                   <li><strong>Extensibility:</strong> If the built-in Terraform providers do not cater to your requirements, you can write custom providers using Go..</li>
               </ul>
               Terraform is an infrastructure-as-code software tool created by HashiCorp. Users define and provide data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language, or optionally
               <br><br>
               <strong>Installation Guide for Ubuntu:</strong><br>
               1. sudo apt update<br>
               2. sudo apt-get install -y gnupg software-properties-common curl<br>
               3. curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -<br>
               4. sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"<br>
               5. sudo apt-get update<br>
               6. sudo apt-get install terraform<br>
               7. git --version
               `;
               imagePath = 'images/terraform.png'
               break;               

            case 'Docker':
                details = `
               <h3>Docker</h3>
               Docker is a platform used to develop, ship, and run applications inside containers. Containers allow a developer to wrap up an application with all the parts it needs, such as libraries and other dependencies, and ship it as one package  
               <ul>
                   <li><strong>Containerization:</strong> At its core, Docker is about running application processes in isolation. These isolated processes are called containers. They are similar to virtual machines, but they are more lightweight and share the host system's OS kernel rather than including their own OS..</li>
                   <li><strong>Image-Based Deployment:</strong> Docker containers are based on Docker images, which are lightweight, standalone, and executable software packages that include everything needed to run a piece of software..</li>
                   <li><strong>Portability:</strong> Since applications are packed with all their dependencies, they can run on any system that runs Docker, regardless of configuration and installed software. This eliminates the "it works on my machine" problem..</li>
                   <li><strong>Version Control for Containers:</strong> Docker Hub and other public repositories provide versioned collections of container images. This makes it easy to distribute, share, and replicate application environments..</li>
                   <li><strong>Integration & Deployment:</strong> Docker can integrate into popular CI/CD pipelines, allowing automated testing, building, and deployment of containerized applications..</li>
                   <li><strong>Ecosystem:</strong> Docker, being a popular platform, has a vast ecosystem, including tools like Docker Compose, Docker Swarm, and many third-party tools and extensions..</li>
                   <li><strong>Isolation:</strong> Each Docker container runs in isolation from others, ensuring that they do not interfere with each other or with the host system..</li>
                   <li><strong>Resource Efficiency:</strong>  Docker containers share the host OS kernel and use the host's resources efficiently, making them lightweight compared to traditional virtual machines..</li>
               </ul>
               Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. The service has both free and premium tiers. The software that hosts the containers is called Docker Engine. It was first released in 2013 and is developed by Docker, Inc
               <br><br>
               <strong>Installation Guide for Ubuntu:</strong><br>
               1. sudo apt update<br>
               2. sudo apt install apt-transport-https ca-certificates curl software-properties-common<br>
               3. curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -<br>
               4. sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"<br>
               5. sudo apt update<br>
               6. sudo apt install docker-ce<br>
               7. docker --version
               `;
               imagePath = 'images/docker.png'
               break;               

            case 'Kubernetes':
                details = `
               <h3>Kubernetes</h3>
               Kubernetes (often abbreviated as K8s) is an open-source platform designed to automate deploying, scaling, and operating application containers. Originally created by Google, it is now maintained by the Cloud Native Computing Foundation (CNCF)
               <ul>
                   <li><strong>Container Orchestration:</strong> Kubernetes is used for orchestrating containers (like Docker) across a cluster of machines, providing tools for deploying applications, scaling them as necessary, and managing changes to existing containerized applications.</li>
                   <li><strong>Service Discovery & Load Balancing:</strong>  Kubernetes can expose a container using a DNS name or using their own IP address. If traffic to a container is high, Kubernetes is able to balance and distribute the network traffic to provide stable application performance..</li>
                   <li><strong>Storage Orchestration:</strong> Kubernetes allows you to automatically mount a storage system of your choice, such as local storage, cloud providers, and more..</li>
                   <li><strong>Automated Rollouts & Rollbacks:</strong> You can describe the desired state for your deployed containers using Kubernetes, and it can change the actual state to the desired state in a controlled manner. If any of the changes to a deployment create an error, Kubernetes can roll back the change for you..</li>
                   <li><strong>Self-Healing:</strong> Kubernetes restarts containers that fail, replaces and reschedules containers when nodes die, kills containers that don’t respond to user-defined health checks, and doesn’t advertise them to clients until they are ready to serve..</li>
                   <li><strong>Secret & Configuration Management:</strong> Kubernetes lets you store and manage sensitive information, such as passwords, OAuth tokens, and ssh keys. You can deploy and update secrets and application configuration without rebuilding your container images and without exposing secrets in your stack configuration..</li>

               </ul>
               Perform the steps below and Kubernetes tools installed on your machine. The kubeadm tool in particular will be of use if you intend to initialize a Kubernetes cluster or join an existing one. Remember, Kubernetes works with a cluster methodology, so for full deployment, you'd typically have multiple machines (nodes) connected together, with one acting as the master node controlling the others.
               <br><br>
               <strong>Installation Guide for Ubuntu:</strong><br>
               1. sudo apt update<br>
               2. sudo apt-get install -y apt-transport-https curl<br>
               3. curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -<br>
               4. echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list<br>
               5. sudo apt update<br>
               6. sudo apt-get install -y kubectl kubeadm kubelet kubernetes-cni<br>
               7. docker --version
               `;
               imagePath = 'images/kubernetes.png'
               break;               
            default:
               details = '';
               imagePath = '';
        }
        document.getElementById('toolDetails').innerHTML = details;

        let toolImageElem = document.getElementById('toolImage');
        if (imagePath) {
            toolImageElem.src = imagePath;
            toolImageElem.style.display = 'block';
        } else {
            toolImageElem.style.display = 'none';
        }
    }
</script>

</body>
</html>