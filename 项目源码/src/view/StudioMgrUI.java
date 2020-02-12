package view;

import java.awt.event.ActionEvent;

import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;

import java.util.List;
import java.util.Iterator;
import domain.Studio;
import service.StudioSrv;

class StudioTableMouseListener extends MouseAdapter {

	private JTable jt;
	static Studio hall;

	public static Studio getHall() {
		return hall;
	}

	public StudioTableMouseListener(JTable jt, Object[] number, Studio hall) {
		this.hall = hall;
		this.jt = jt;
	}

	// 监听到行号，将所选行的内容依次赋到 hall 静态对象，以便传有值对象到修改面板进行修改
	public void mouseClicked(MouseEvent event) {
		int row = jt.getSelectedRow();
		hall.setID(Integer.parseInt(jt.getValueAt(row, 0).toString()));
		hall.setName(jt.getValueAt(row, 1).toString());
		hall.setRowCount(Integer.parseInt(jt.getValueAt(row, 2).toString())); // 0
		hall.setColCount(Integer.parseInt(jt.getValueAt(row, 3).toString()));
		if(jt.getValueAt(row, 4)!=null)
			hall.setIntroduction(jt.getValueAt(row, 4).toString());
		else
			hall.setIntroduction("");
		System.out.println(jt.getValueAt(row, 1).toString());
	}
}

class StudioTable {

	static Studio hall;
	private JTable jt = null;

	public StudioTable(Studio hall) {
		this.hall = hall;
	}

	// 创建JTable
	public void createTable(JScrollPane jp, Object[] columnNames,
			List<Studio> stuList) {
		try {

			Object data[][] = new Object[stuList.size()][columnNames.length];

			Iterator<Studio> itr = stuList.iterator();
			int i = 0;
			while (itr.hasNext()) {

				Studio stu = itr.next();
				data[i][0] = Integer.toString(stu.getID());
				data[i][1] = stu.getName();
				data[i][2] = Integer.toString(stu.getRowCount());
				data[i][3] = Integer.toString(stu.getColCount());
				data[i][4] = stu.getIntroduction();				
				i++;
			}

			// 生成JTable
			jt = new JTable(data, columnNames);
			jt.setBounds(0, 0, 700, 450);

			// 添加鼠标监听，监听到所选行
			StudioTableMouseListener tml = new StudioTableMouseListener(jt,
					columnNames, hall);
			jt.addMouseListener(tml);

			// 设置可调整列宽
			jt.setAutoResizeMode(JTable.AUTO_RESIZE_ALL_COLUMNS);

			jp.add(jt);
			jp.setViewportView(jt);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

public class StudioMgrUI extends JFrame implements ActionListener {
	static Studio hall;

	// 界面提示
	private JLabel ca1 = null;

	// 用来放表格的滚动控件
	private JScrollPane jsc;

	// 查找的提示和输出
	private JLabel hint;
	private JTextField input;

	// 查找，编辑和删除按钮

	private JButton btnAdd, btnEdit, btnDel, btnQuery;

	public StudioMgrUI(Studio hall) {
		this.hall = hall;

		ca1 = new JLabel("演出厅管理");
		ca1.setBounds(280, 6, 480, 26);

		jsc = new JScrollPane();
		jsc.setBounds(50, 40, 700, 450);
		this.add(jsc);

		hint = new JLabel("请输入演出厅名称:");
		hint.setBounds(60, 500, 150, 30);
		this.add(hint);

		input = new JTextField();
		input.setBounds(300, 500, 120, 30);
		this.add(input);

		// 查找 ，删除和编辑的按钮，其中含有相关的事件处理！
		btnQuery = new JButton("查找");
		btnQuery.addActionListener(this);
		btnQuery.setBounds(440, 500, 60, 30);
		this.add(btnQuery);

		btnAdd = new JButton("添加");
		btnAdd.addActionListener(this);
		btnAdd.setBounds(520, 500, 60, 30);
		this.add(btnAdd);
		
		btnEdit = new JButton("编辑");
		btnEdit.addActionListener(this);
		btnEdit.setBounds(600, 500, 60, 30);
		this.add(btnEdit);
		
		btnDel = new JButton("删除");
		btnDel.addActionListener(this);
		btnDel.setBounds(680, 500, 60, 30);
		this.add(btnDel);

		this.add(ca1);
		this.setLayout(null);
		showTable();
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		if (e.getSource() == btnQuery) {
			if (!input.getText().equals("")) {
				/*
				 * String sql =
				 * " select * from hall where hall_descp = '"+input.
				 * getText()+"'"; HallTableModel tms = new HallTableModel(hall);
				 */
				jsc.repaint();
				Object[] in = { "id", "name", "row", "column", "hall_descp" };
				// tms.createTable(jsc, in, sql);

			} else {
				JOptionPane.showMessageDialog(null, "未输入任何内容");
			}
		} else if (e.getSource() == btnAdd) {
			 StudioEditUI a = new StudioEditUI(this,false,null);
			 a.toFront();
			 a.setModal(true);
			 a.setVisible(true);
			 if(a.getReturnStatus()){
				 showTable();
			 }
			 
		} else if (e.getSource() == btnEdit) {
			StudioEditUI a = new StudioEditUI(this,true,hall);
			 a.toFront();
			 a.setModal(true);
			 a.setVisible(true);
			 if(a.getReturnStatus()){
				 showTable();
			 }			 
			 
		} else if (e.getSource() == btnDel) {
			int confirm = JOptionPane.showConfirmDialog(null, "确认删除所选？", "删除",
					JOptionPane.YES_NO_OPTION);
			if (confirm == JOptionPane.YES_OPTION) {
				 StudioSrv stuSrv = new StudioSrv();
				 stuSrv.delete(hall.getID());			
				 showTable();
			}
		}
	}

	public void showTable() {
		StudioTable tms = new StudioTable(hall);
		Object[] in = { "id", "name", "row", "column", "hall_descp" };
		List<Studio> stuList = new StudioSrv().FetchAll();

		tms.createTable(jsc, in, stuList);

		jsc.repaint();
	}

	public static void main(String[] args) {
		StudioMgrUI frmStuMgr = new StudioMgrUI(new Studio());
		frmStuMgr.setLayout(null);
		frmStuMgr.setBounds(0, 0, 800, 600);
		frmStuMgr.setSize(800, 650);
		frmStuMgr.setVisible(true);
	}
}
