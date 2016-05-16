#tool "KuduSync.NET" "https://www.nuget.org/api/v2/"
#tool nuget:?package=Wyam&prerelease

#addin "Cake.Kudu" "https://www.nuget.org/api/v2/"
#addin nuget:?package=Cake.Wyam&prerelease

///////////////////////////////////////////////////////////////////////////////
// ARGUMENTS
///////////////////////////////////////////////////////////////////////////////

var target = Argument("target", "Default");

///////////////////////////////////////////////////////////////////////////////
// GLOBAL VARIABLES
///////////////////////////////////////////////////////////////////////////////

var websitePath     = MakeAbsolute(Directory("./src/TestWebSite"));

if (!Kudu.IsRunningOnKudu)
{
    throw new Exception("Not running on Kudu");
}

var deploymentPath = Kudu.Deployment.Target;
if (!DirectoryExists(deploymentPath))
{
    throw new DirectoryNotFoundException(
        string.Format(
            "Deployment target directory not found {0}",
            deploymentPath
            )
        );
}

///////////////////////////////////////////////////////////////////////////////
// TASK DEFINITIONS
///////////////////////////////////////////////////////////////////////////////


Task("Publish")
    .IsDependentOn("Build")
    .Does(() =>
{
    Information("Deploying web from {0} to {1}", websitePath, deploymentPath);
    Kudu.Sync(websitePath);
});


Task("Build")
    .Does(() =>
    {
        Wyam(new WyamSettings
        { 
            OutputPath  = websitePath
        });        
    });
    
Task("Preview")
    .Does(() =>
    {
        Wyam(new WyamSettings
        { 
            OutputPath  = websitePath,
            Preview = true,
            Watch = true
        });        
    });

Task("Default")
    .IsDependentOn("Publish");

///////////////////////////////////////////////////////////////////////////////
// EXECUTION
///////////////////////////////////////////////////////////////////////////////

RunTarget(target);