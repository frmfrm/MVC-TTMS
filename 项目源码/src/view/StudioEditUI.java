package view;

import javax.swing.JDialog;

import java.awt.Color;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import service.StudioSrv;
import domain.*;

public class StudioEditUI extends JDialog implements ActionListener {

	private Studio stu;

	private int select;
	private boolean opMod; // 操作模式, false为新增; true为修改
	
	private boolean rst=false; //操作结果

	private JFrame jf; //  这个frame的作用是什么？
	private JButton cancel, edit; // 取消和修改键

	// 添加需要添加的内容 ， 和添加是一致的！
	private JLabel lblName, lblRow, lblColumn;
	private JTextField txtName, txtRow, txtColumn;

	public StudioEditUI(final JFrame jf, boolean mod, Studio stu) {

		this.setTitle("编辑影厅");

		JPanel mainPanel = new JPanel();
		mainPanel.setBounds(0, 1, 540, 300);
		mainPanel.setBackground(Color.white);
		mainPanel.setLayout(null);

		lblName = new JLabel("影厅名称：");
		lblName.setBounds(60, 30, 80, 30);
		mainPanel.add(lblName);
		txtName = new JTextField();
		txtName.setBounds(150, 30, 120, 30);
		mainPanel.add(txtName);

		lblRow = new JLabel("行数：");
		lblRow.setBounds(60, 80, 50, 30);
		mainPanel.add(lblRow);
		txtRow = new JTextField();
		txtRow.setBounds(150, 80, 120, 30);
		mainPanel.add(txtRow);

		lblColumn = new JLabel("列数：");
		lblColumn.setBounds(60, 130, 90, 30);
		mainPanel.add(lblColumn);
		txtColumn = new JTextField();
		txtColumn.setBounds(150, 130, 120, 30);
		mainPanel.add(txtColumn);

		edit = new JButton("保存");

		edit.addActionListener(this);
		edit.setBounds(60, 220, 60, 30);
		mainPanel.add(edit);

		cancel = new JButton("取消");
		cancel.addActionListener(this);
		cancel.setBounds(180, 220, 60, 30);
		mainPanel.add(cancel);

		ImageJPanel imageJP = new ImageJPanel(new ImageIcon(
				"files/imgs/pencil.jpg").getImage());
		imageJP.setBounds(360, 160, 100, 100);
		imageJP.setLayout(null);
		this.add(imageJP);

		this.setLayout(null);
		this.add(mainPanel);

		this.setSize(540, 320);
		this.setLocationRelativeTo(null);

		this.setResizable(false);

		this.setAlwaysOnTop(true);

		this.jf = jf;
		opMod = mod;

		if (opMod) {
			this.stu = stu;
			initData(stu);
		} else
			this.stu = new Studio();

		jf.setVisible(false);

		this.addWindowListener(new WindowAdapter() {
			public void windowClosing(WindowEvent e) {
				jf.setEnabled(true);
			}
		});

	}

	private void initData(Studio stu) {
		txtName.setText(stu.getName());
		txtRow.setText(Integer.toString(stu.getRowCount()));
		txtColumn.setText(Integer.toString(stu.getColCount()));
	}
	
	public boolean getReturnStatus(){
		   return rst;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == cancel) {
			this.dispose();
			jf.setEnabled(true);

		} else if (e.getSource() == edit) {

			if (txtName.getText() != null && txtRow.getText() != null
					&& txtColumn.getText() != null) {
				StudioSrv stuSrv = new StudioSrv();
				stu.setName(txtName.getText());
				stu.setRowCount(Integer.parseInt(txtRow.getText()));
				stu.setColCount(Integer.parseInt(txtColumn.getText()));
				stu.setIntroduction("test");

				if (opMod)
					stuSrv.modify(stu);
				else
					stuSrv.add(stu);

				this.setVisible(false);
				rst=true;
				jf.setVisible(true);
			} else {
				JOptionPane.showMessageDialog(null, "数据不完整");
			}
		}

	}

}
