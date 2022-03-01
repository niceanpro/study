#include <iostream>
#include <vector>

using namespace std;

int n, cnt;
int a[5][5] = { 1, 1, 1, 0, 0,
				1, 0, 1, 1, 1,
				1, 0, 1, 0, 1,
				1, 0, 1, 0, 1,
				1, 1, 1, 1, 1 };

class dt {
public :
	int y;
	int x;
};

vector<dt> v;

void DFS(int y, int x, int Ey, int Ex)
{
	// ������ ��ġ�� �����ϸ� ��� ���� 1����, ���� ����
	dt d1;
	d1.y = y; d1.x = x;
	v.push_back(d1);

	if (y == Ey && x == Ex) {
		cout << endl <<  "search path length = " << v.size() << endl;
		cnt++;

		for (int i = 0; i < v.size(); i++) {
			dt b = v.at(i);
			cout << "(y, x) = (" << b.y << ", " << b.x << ")" << endl;
		}
	}

	// �ٽ� �湮���� �ʵ��� 0���� �ӽ������� �ٲ�
	a[y][x] = 0;

	if (y > 0 && a[y - 1][x] == 1)			{ DFS(y - 1, x, Ey, Ex);	v.pop_back();	}// up
	if (y < n - 1 && a[y + 1][x] == 1)		{ DFS(y + 1, x, Ey, Ex);	v.pop_back();	}// down
	if (x > 0 && a[y][x - 1] == 1)			{ DFS(y, x - 1, Ey, Ex);	v.pop_back();	}// left
	if (x < n - 1 && a[y][x + 1] == 1)		{ DFS(y, x + 1, Ey, Ex);	v.pop_back();	 }// right

	// 1�� �ٽ� ����
	a[y][x] = 1;
}

int main()
{
	n = 5;

	int Sy = 0, Sx = 0;
	int Ey = 4, Ex = 2;
	DFS(Sy, Sx, Ey, Ex);
	if(cnt > 0)
		cout << endl << "search path (" << Sy << ", " << Sx << ") => (" << Ey << ", " << Ex << ") found!  count = " << cnt << endl;
	else
		cout << endl << "search path (" << Sy << ", " << Sx << ") => (" << Ey << ", " << Ex << ") not found!" << endl;

	int g;
	cin >> g ;
	return 0;
}