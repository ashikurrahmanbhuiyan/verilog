#include <bits/stdc++.h>
using namespace std;

class Graph {
public:
  map<int, bool> visited;
  map<int, list<int> > l;
  
  void addEdge(int x,int y){
      l[x].push_back(y);
      //l[y].push_back(x);
  }

	void BFS(int s) {
  	visited[s] = true;
    list<int> q;
  	q.push_back(s);
  	while (!q.empty()) {
	  	cout << q.front() << " ";
	    for(auto i:l[q.front()]){
	    	if (!visited[i]) {
	    	 	visited[i] = true;
	   	   	q.push_back(i);
	   	  }
      }
      q.pop_front();
	  }
  }
  void DFS(int s){
  visited[s] = true;
  cout << s << " ";
  for (auto i : l[s])
    if (!visited[i])
      DFS(i);
  }
};

int main() {
  Graph g;
  g.addEdge(0, 1);
  g.addEdge(0, 2);
  g.addEdge(1, 2);
  g.addEdge(2, 0);
  g.addEdge(2, 3);
  g.addEdge(3, 3);

  g.BFS(2);
  cout<<endl;
  g.DFS(1);
  return 0;
}




#include <bits/stdc++.h>
using namespace std;
class Node{
public:
	int data;
	Node* left;
	Node* right;
	Node(int data){
		this->data = data;
	}
};
Node* input(Node* root, int value)
{
    if (!root)
        return new Node(value);
    if (value > root->data)
        root->right = input(root->right, value);
    else if (value <= root->data)
        root->left = input(root->left, value);
    return root;
}

void print(Node* root){
	if(root == NULL) return;
	print(root->left);
	cout<<root->data<<" ";
	print(root->right);
}
int main(){
	Node* root = new Node(50);
	input(root, 21);
	input(root,99);
	print(root);
}




#include <bits/stdc++.h>
using namespace std;

class Heap{
	vector<int> v;
	public:
		void push(int data){
			v.push_back(data);
			int i = v.size()-1;
			int p = i/2;
			while(i>1 && v[i]>v[p]){
				swap(v[i],v[p]);
				i = p;
				p = p/2;
			}
		}
		

		int top(){
			cout<<v[1]<<endl;
			return v[1];
		}
		void print(){
			for(auto i:v){
				cout<<i<<" ";
			}
		}
};

int main(){
	Heap h;
	h.push(2);
	h.push(6);
	h.push(1);
	h.push(7);
	h.push(5);
	//h.top();
	h.print();
}







#include<bits/stdc++.h>
using namespace std;
int main()
{
    int n;
    cout<<"Enter the number of vertex:\n";
    cin>>n;
    int arr[n+1][n+1];
    int m;
    cout<<"Enter the number of edges:\n";
    cin>>m;
    memset(arr,0,sizeof(arr));
    for(int i=0;i<m;i++)
    {
        int u,v;
        cin>>u>>v;
        if(u>n||v>n)
        cout<<"Invalid argument"<<endl;
        else
         {
            arr[u][v]=1;
            arr[v][u]=1;  // this line only for undirected graph
         }

    }

    cout<<"Here is the adjacency matrix:"<<endl;
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=n;j++)
        {
            cout<<arr[i][j]<<" ";
        }
        cout<<endl;
    }

    for(int i=1;i<=n;i++)
    {
        cout<<"Adjacent of node "<<i<<" is :"<<endl;
        for(int j=1;j<=n;j++)
        {
            if(arr[i][j])
             cout<<j<<" ";

        }
        cout<<endl;
    }

    // power matrix...

    int powMatrix[n+1][n+1][n+1];

    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=n;j++)
        {
            powMatrix[1][i][j]=arr[i][j];
        }
    }

    for(int i=2;i<=n;i++)
    {
        for(int j=1;j<=n;j++)
        {
            for(int k=1;k<=n;k++)
            {
                int temp=0;
                for(int l=1;l<=n;l++)
                {
                    temp+=powMatrix[i-1][j][l]*arr[l][k];
                }
                powMatrix[i][j][k]=temp;
            }
        }
    }

    for(int i=1;i<=n;i++)
    {
        cout<<"power matrix of "<<i<<" is:"<<endl;
        for(int j=1;j<=n;j++)
        {
            for(int k=1;k<=n;k++)
            {
                printf("%3d",powMatrix[i][j][k]);
            }
            cout<<endl;
        }
    }

    int Br[n+1][n+1];

    memset(Br,0,sizeof(Br));

    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=n;j++)
        {
            for(int k=1;k<=n;k++)
            {
                Br[j][k]+=powMatrix[i][j][k];
            }
        }
    }

    int cnt=0;

    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=n;j++)
        {
            if(Br[i][j]==0)
             cnt++;
        }
    }

    if(cnt==0)
      cout<<"Strongly connected"<<endl;
    else
      cout<<"Not strongly connected"<<endl;
}
